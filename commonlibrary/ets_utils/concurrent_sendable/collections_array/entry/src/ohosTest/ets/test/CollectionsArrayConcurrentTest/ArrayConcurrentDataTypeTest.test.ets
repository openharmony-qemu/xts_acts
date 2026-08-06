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
async function stringForEachTask(arr: collections.Array<string>): Promise<number> {
  let count: number = 0;
  arr.forEach((value: string): void => { count++; });
  return count;
}

@Concurrent

async function numberPushTask(arr: collections.Array<number>, values: number[],
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    for (let i: number = 0; i < values.length; i++) {
      arr.push(values[i]);
    }
    return arr.length;
  });
}

@Concurrent
async function booleanIncludesTask(arr: collections.Array<boolean>, target: boolean): Promise<boolean> {
  return arr.includes(target);
}

@Concurrent

async function nullPushPopTask(arr: collections.Array<number | null>,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    arr.push(null);
    const val: number | null | undefined = arr.pop();
    return val === null ? 1 : 0;
  });
}

@Concurrent

async function undefinedPushTask(arr: collections.Array<number | undefined>,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    arr.push(undefined);
    return arr.length;
  });
}

export default function arrayConcurrentDataTypeTest(): void {
  describe("arrayConcurrentDataTypeTest", (): void => {
    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_DATATYPE_0100
     * @tc.name      testArrayConcurrentStringForEach0001
     * @tc.desc      Verify concurrent forEach traversal on a collections.Array<string>
     *               with unicode strings completes without data loss.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentStringForEach0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentStringForEach0001";
        console.log(TAG + " start");
        const arr: collections.Array<string> = new collections.Array<string>();
        arr.push("test123");
        arr.push("a\n\t\u200B\u0000");
        arr.push("testTest😀🎉🔥");
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(stringForEachTask, arr));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(3);
        }
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_DATATYPE_0200
     * @tc.name      testArrayConcurrentSpecialNumberPush0001
     * @tc.desc      Verify concurrent push of special number values (NaN,
     *               MAX_SAFE_INTEGER, 1.5e-10) into a collections.Array<number>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentSpecialNumberPush0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentSpecialNumberPush0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = new collections.Array<number>();
        const tasks: Promise<Object>[] = [];
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        const values1: number[] = [100, 1.5e-10];
        const values2: number[] = [NaN];
        const values3: number[] = [Number.MAX_SAFE_INTEGER];
        tasks.push(taskpool.execute(numberPushTask, arr, values1, lock));
        tasks.push(taskpool.execute(numberPushTask, arr, values2, lock));
        tasks.push(taskpool.execute(numberPushTask, arr, values3, lock));
        await Promise.all(tasks);
        expect(arr.length).assertEqual(4);
        let foundNaN: boolean = false;
        for (let j: number = 0; j < arr.length; j++) {
          if (Number.isNaN(arr[j] as number)) { foundNaN = true; break; }
        }
        expect(foundNaN).assertTrue();
        expect(arr.indexOf(Number.MAX_SAFE_INTEGER) >= 0).assertTrue();
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_DATATYPE_0300
     * @tc.name      testArrayConcurrentBooleanQuery0001
     * @tc.desc      Verify concurrent includes query on a collections.Array<boolean>
     *               returns correct boolean results in all tasks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentBooleanQuery0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentBooleanQuery0001";
        console.log(TAG + " start");
        const arr: collections.Array<boolean> = new collections.Array<boolean>();
        arr.push(true);
        arr.push(false);
        const tasks: Promise<Object>[] = [];
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(booleanIncludesTask, arr, true));
          tasks.push(taskpool.execute(booleanIncludesTask, arr, false));
        }
        const results: Object[] = await Promise.all(tasks);
        for (let i: number = 0; i < results.length; i += 2) {
          expect(results[i] as boolean).assertTrue();
          expect(results[i + 1] as boolean).assertTrue();
        }
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_DATATYPE_0400
     * @tc.name      testArrayConcurrentNullHandling0001
     * @tc.desc      Verify concurrent push and pop of null values on a
     *               collections.Array<number | null>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentNullHandling0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentNullHandling0001";
        console.log(TAG + " start");
        const arr: collections.Array<number | null> =
          new collections.Array<number | null>();
        arr.push(1);
        const tasks: Promise<Object>[] = [];
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(nullPushPopTask, arr, lock));
        }
        const results: Object[] = await Promise.all(tasks);
        let nullCount: number = 0;
        for (let i: number = 0; i < results.length; i++) {
          nullCount += results[i] as number;
        }
        expect(nullCount).assertEqual(4);
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_DATATYPE_0500
     * @tc.name      testArrayConcurrentUndefinedPush0001
     * @tc.desc      Verify concurrent push of undefined into a
     *               collections.Array<number | undefined>.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentUndefinedPush0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentUndefinedPush0001";
        console.log(TAG + " start");
        const arr: collections.Array<number | undefined> =
          new collections.Array<number | undefined>();
        const tasks: Promise<Object>[] = [];
        const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        for (let i: number = 0; i < 4; i++) {
          tasks.push(taskpool.execute(undefinedPushTask, arr, lock));
        }
        await Promise.all(tasks);
        expect(arr.length).assertEqual(4);
        expect(arr[0] as number | undefined).assertEqual(undefined);
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });
  });
}
