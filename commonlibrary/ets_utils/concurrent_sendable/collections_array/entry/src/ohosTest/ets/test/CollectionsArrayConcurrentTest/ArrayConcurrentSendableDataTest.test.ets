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
import { SendableWrapper } from "./SendableWrapper";

@Concurrent
async function sendableClassPushTask(arr: collections.Array<SendableWrapper>,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    arr.push(new SendableWrapper(42));
    return arr.length;
  });
}

@Concurrent
async function nestedArrayTask(outer: collections.Array<collections.Array<number>>,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    const inner: collections.Array<number> = new collections.Array<number>();
    inner.push(1);
    outer.push(inner);
    return outer.length;
  });
}

@Concurrent
async function mapPutTask(map: collections.Map<number, string>,
  lock: ArkTSUtils.locks.AsyncLock, index: number): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    map.set(index, "v" + index);
    return map.size;
  });
}

@Concurrent
async function setAddTask(set: collections.Set<number>,
  lock: ArkTSUtils.locks.AsyncLock, value: number): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    set.add(value);
    return set.size;
  });
}

export default function arrayConcurrentSendableDataTest(): void {
  describe("arrayConcurrentSendableDataTest", (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_SENDABLE_0100
     * @tc.name      testArrayConcurrentSendableClass0001
     * @tc.desc      Verify concurrent push of @Sendable class instances into
     *               a collections.Array and the instances are correctly stored.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentSendableClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentSendableClass0001";
        console.log(TAG + " start");
        const arr: collections.Array<SendableWrapper> =
          new collections.Array<SendableWrapper>();
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(sendableClassPushTask, arr, lock));
        }
        await Promise.all(tasks);
        expect(arr.length).assertEqual(4);
        expect(arr[0].value).assertEqual(42);
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_SENDABLE_0200
     * @tc.name      testArrayConcurrentNestedArray0001
     * @tc.desc      Verify concurrent push of nested collections.Array instances
     *               into an outer collections.Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentNestedArray0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentNestedArray0001";
        console.log(TAG + " start");
        const outer: collections.Array<collections.Array<number>> =
          new collections.Array<collections.Array<number>>();
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(nestedArrayTask, outer, lock));
        }
        await Promise.all(tasks);
        expect(outer.length).assertEqual(4);
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_SENDABLE_0300
     * @tc.name      testArrayConcurrentMapPut0001
     * @tc.desc      Verify concurrent put operations on a collections.Map
     *               from multiple TaskPool tasks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentMapPut0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentMapPut0001";
        console.log(TAG + " start");
        const map: collections.Map<number, string> =
          new collections.Map<number, string>();
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(mapPutTask, map, lock, i));
        }
        await Promise.all(tasks);
        expect(map.size).assertEqual(4);
        for (let i: number = 0; i < 4; i++) {
          expect(map.has(i)).assertTrue();
          expect(map.get(i)).assertEqual("v" + i);
        }
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_SENDABLE_0400
     * @tc.name      testArrayConcurrentSetAdd0001
     * @tc.desc      Verify concurrent add operations on a collections.Set
     *               from multiple TaskPool tasks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentSetAdd0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentSetAdd0001";
        console.log(TAG + " start");
        const set: collections.Set<number> = new collections.Set<number>();
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(setAddTask, set, lock, i));
        }
        await Promise.all(tasks);
        expect(set.size).assertEqual(4);
        for (let i: number = 0; i < 4; i++) {
          expect(set.has(i)).assertTrue();
        }
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });
  });
}
