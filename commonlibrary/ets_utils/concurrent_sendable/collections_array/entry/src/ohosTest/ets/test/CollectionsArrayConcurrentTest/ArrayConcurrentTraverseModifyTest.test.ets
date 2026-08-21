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
import { BusinessError } from "@ohos.base";
import {
  createSharedBarrier,
  createSharedSignal,
  notifySharedSignal,
  waitAtSharedBarrier,
  waitForSharedSignal
} from "../SharedLock";

@Concurrent
async function entriesTraverse(arr: collections.Array<number>, barrier: SharedArrayBuffer,
  signal: SharedArrayBuffer): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  try {
    let count: number = 0;
    const iterator: IterableIterator<[number, number]> = arr.entries();
    let entry: IteratorResult<[number, number]> = iterator.next();
    while (!entry.done) {
      count++;
      entry = iterator.next();
      if (count === 100) {
        notifySharedSignal(signal, 0);
        if (!waitForSharedSignal(signal, 1, 5000)) { return "error:timeout"; }
        notifySharedSignal(signal, 2);
      }
    }
    return "success";
  } catch (err) {
    const errorCode: number = (err as BusinessError).code;
    return errorCode === 10200201 ? "error:10200201" : "error:unknown";
  }
}

@Concurrent
async function valuesTraverse(arr: collections.Array<number>, barrier: SharedArrayBuffer,
  signal: SharedArrayBuffer): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  try {
    let count: number = 0;
    const iterator: IterableIterator<number> = arr.values();
    let val: IteratorResult<number> = iterator.next();
    while (!val.done) {
      count++;
      val = iterator.next();
      if (count === 100) {
        notifySharedSignal(signal, 0);
        if (!waitForSharedSignal(signal, 1, 5000)) { return "error:timeout"; }
        notifySharedSignal(signal, 2);
      }
    }
    return "success";
  } catch (err) {
    const errorCode: number = (err as BusinessError).code;
    return errorCode === 10200201 ? "error:10200201" : "error:unknown";
  }
}

@Concurrent
async function modifyFill(arr: collections.Array<number>, barrier: SharedArrayBuffer,
  signal: SharedArrayBuffer): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  if (!waitForSharedSignal(signal, 0, 5000)) { return "error:timeout"; }
  notifySharedSignal(signal, 1);
  if (!waitForSharedSignal(signal, 2, 5000)) { return "error:timeout"; }
  try {
    arr.fill(0);
    return "success";
  } catch (err) {
    const errorCode: number = (err as BusinessError).code;
    return errorCode === 10200201 ? "error:10200201" : "error:unknown";
  }
}

@Concurrent
async function modifyUnshift(arr: collections.Array<number>, barrier: SharedArrayBuffer,
  signal: SharedArrayBuffer): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  if (!waitForSharedSignal(signal, 0, 5000)) { return "error:timeout"; }
  notifySharedSignal(signal, 1);
  if (!waitForSharedSignal(signal, 2, 5000)) { return "error:timeout"; }
  try {
    arr.unshift(9999);
    return "success";
  } catch (err) {
    const errorCode: number = (err as BusinessError).code;
    return errorCode === 10200201 ? "error:10200201" : "error:unknown";
  }
}

function makeArray(count: number): collections.Array<number> {
  const arr: collections.Array<number> = new collections.Array<number>();
  for (let i: number = 0; i < count; i++) { arr.push(i); }
  return arr;
}

async function runModifyTest(arr: collections.Array<number>,
  traverseTask: Function, modifyTask: Function): Promise<boolean> {
  const barrier: SharedArrayBuffer = createSharedBarrier();
  const signal: SharedArrayBuffer = createSharedSignal(3);
  try {
    const results: Object[] = await Promise.all([
      taskpool.execute(traverseTask, arr, barrier, signal),
      taskpool.execute(modifyTask, arr, barrier, signal)
    ]);
    for (let i: number = 0; i < results.length; i++) {
      const status: string = results[i] as string;
      if (status !== "success" && status !== "error:10200201") { return false; }
    }
    return true;
  } catch (err) {
    return (err as BusinessError).code === 10200201;
  }
}

export default function arrayConcurrentTraverseModifyTest(): void {
  describe("arrayConcurrentTraverseModifyTest", (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_TRAVMOD_0500
     * @tc.name      testArrayConcurrentEntriesModify0002
     * @tc.desc      Verify concurrent fill during entries traversal on collections.Array
     *               completes normally or reports concurrent modification error 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentEntriesModify0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentEntriesModify0002";
        console.log(TAG + " start");
        const arr: collections.Array<number> = makeArray(1000);
        let errorDetected: boolean = false;
        try {
          errorDetected = await runModifyTest(arr, entriesTraverse, modifyFill);
        } catch (err) {
          console.error(`runModifyTest failed: ${JSON.stringify(err)}`);
        }
        expect(errorDetected).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_TRAVMOD_0600
     * @tc.name      testArrayConcurrentValuesModify0001
     * @tc.desc      Verify concurrent unshift during values traversal on collections.Array
     *               completes normally or reports concurrent modification error 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentValuesModify0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentValuesModify0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = makeArray(1000);
        let errorDetected: boolean = false;
        try {
          errorDetected = await runModifyTest(arr, valuesTraverse, modifyUnshift);
        } catch (err) {
          console.error(`runModifyTest failed: ${JSON.stringify(err)}`);
        }
        expect(errorDetected).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
  });
}
