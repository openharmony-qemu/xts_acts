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
    notifySharedSignal(signal, 0);
    if (!waitForSharedSignal(signal, 1, 5000)) { return "error:unknown"; }
    while (!entry.done) {
      count++;
      entry = iterator.next();
      if (count === 100) {
        notifySharedSignal(signal, 2);
      }
    }
    return "success";
  } catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) { return "error:10200201"; }
    return "error:unknown";
  }
}

@Concurrent
async function keysTraverse(arr: collections.Array<number>, barrier: SharedArrayBuffer,
  signal: SharedArrayBuffer): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  try {
    let count: number = 0;
    const iterator: IterableIterator<number> = arr.keys();
    let key: IteratorResult<number> = iterator.next();
    notifySharedSignal(signal, 0);
    if (!waitForSharedSignal(signal, 1, 5000)) { return "error:unknown"; }
    while (!key.done) {
      count++;
      key = iterator.next();
      if (count === 100) {
        notifySharedSignal(signal, 2);
        if (!waitForSharedSignal(signal, 3, 5000)) { return "error:unknown"; }
      }
      if (count % 100 === 0) {
        const _val: number | undefined = arr[key.value as number];
      }
    }
    return "success";
  } catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) { return "error:10200201"; }
    return "error:unknown";
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
    notifySharedSignal(signal, 0);
    if (!waitForSharedSignal(signal, 1, 5000)) { return "error:unknown"; }
    while (!val.done) {
      count++;
      val = iterator.next();
      if (count === 100) {
        notifySharedSignal(signal, 2);
      }
    }
    return "success";
  } catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) { return "error:10200201"; }
    return "error:unknown";
  }
}

@Concurrent
async function modPush(arr: collections.Array<number>, barrier: SharedArrayBuffer,
  signal: SharedArrayBuffer): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  if (!waitForSharedSignal(signal, 0, 3000)) {
    return "error:unknown";
  }
  notifySharedSignal(signal, 1);
  if (!waitForSharedSignal(signal, 2, 5000)) { return "error:unknown"; }
  try {
    arr.push(9999);
    for (let i: number = 0; i < 1000; i++) {
      arr.push(9999);
    }
    return "success";
  } catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) { return "error:10200201"; }
    return "error:unknown";
  }
}

@Concurrent
async function modPushForKeys(arr: collections.Array<number>, barrier: SharedArrayBuffer,
  signal: SharedArrayBuffer): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  if (!waitForSharedSignal(signal, 0, 3000)) {
    return "error:unknown";
  }
  notifySharedSignal(signal, 1);
  if (!waitForSharedSignal(signal, 2, 5000)) { return "error:unknown"; }
  try {
    arr.push(9999);
    notifySharedSignal(signal, 3);
    for (let i: number = 0; i < 1000; i++) {
      arr.push(9999);
    }
    return "success";
  } catch (err) {
    notifySharedSignal(signal, 3);
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) { return "error:10200201"; }
    return "error:unknown";
  }
}

@Concurrent
async function modPop(arr: collections.Array<number>, barrier: SharedArrayBuffer,
  signal: SharedArrayBuffer): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  if (!waitForSharedSignal(signal, 0, 3000)) {
    return "error:unknown";
  }
  notifySharedSignal(signal, 1);
  if (!waitForSharedSignal(signal, 2, 5000)) { return "error:unknown"; }
  try {
    arr.pop();
    for (let i: number = 0; i < 1000; i++) {
      arr.pop();
    }
    return "success";
  } catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) { return "error:10200201"; }
    return "error:unknown";
  }
}

@Concurrent
async function modSplice(arr: collections.Array<number>, barrier: SharedArrayBuffer,
  signal: SharedArrayBuffer): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  if (!waitForSharedSignal(signal, 0, 3000)) {
    return "error:unknown";
  }
  notifySharedSignal(signal, 1);
  if (!waitForSharedSignal(signal, 2, 5000)) { return "error:unknown"; }
  try {
    arr.splice(10, 5);
    notifySharedSignal(signal, 3);
    for (let i: number = 0; i < 20; i++) {
      arr.splice(10, 5);
    }
    return "success";
  } catch (err) {
    notifySharedSignal(signal, 3);
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) { return "error:10200201"; }
    return "error:unknown";
  }
}

@Concurrent
async function modFill(arr: collections.Array<number>, barrier: SharedArrayBuffer,
  signal: SharedArrayBuffer): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  if (!waitForSharedSignal(signal, 0, 3000)) {
    return "error:unknown";
  }
  notifySharedSignal(signal, 1);
  if (!waitForSharedSignal(signal, 2, 5000)) { return "error:unknown"; }
  try {
    arr.fill(0);
    for (let i: number = 0; i < 5; i++) {
      arr.fill(0);
    }
    return "success";
  } catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) { return "error:10200201"; }
    return "error:unknown";
  }
}

function makeArray(count: number): collections.Array<number> {
  const arr: collections.Array<number> = new collections.Array<number>();
  for (let i: number = 0; i < count; i++) { arr.push(i); }
  return arr;
}

async function runTest(arr: collections.Array<number>, traverseTask: Function,
  modifyTask: Function): Promise<boolean> {
  const barrier: SharedArrayBuffer = createSharedBarrier();
  const signal: SharedArrayBuffer = createSharedSignal(4);
  try {
    const results: Object[] = await Promise.all([
      taskpool.execute(traverseTask, arr, barrier, signal),
      taskpool.execute(modifyTask, arr, barrier, signal)
    ]);
    for (let i: number = 0; i < results.length; i++) {
      if ((results[i] as string).indexOf("error:unknown") >= 0) { return false; }
    }
    return true;
  } catch (err) {
    const errStr: string = JSON.stringify(err);
    if (errStr.indexOf("unknown") >= 0 || errStr.indexOf("timeout") >= 0) { return false; }
    return true;
  }
}

export default function arrayConcurrentIteratorModifyTest(): void {
  describe("arrayConcurrentIteratorModifyTest", (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_CFM_1000
     * @tc.name      testArrayConcurrentEntriesPush0001
     * @tc.desc      Verify concurrent push during entries traversal triggers 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentEntriesPush0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentEntriesPush0001";
        console.log(TAG + " start");
        expect(await runTest(makeArray(100000), entriesTraverse, modPush)).assertTrue();
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_CFM_1100
     * @tc.name      testArrayConcurrentEntriesPop0001
     * @tc.desc      Verify concurrent pop during entries traversal triggers 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentEntriesPop0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentEntriesPop0001";
        console.log(TAG + " start");
        expect(await runTest(makeArray(100000), entriesTraverse, modPop)).assertTrue();
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_CFM_1200
     * @tc.name      testArrayConcurrentKeysPush0001
     * @tc.desc      Verify concurrent push during keys traversal triggers 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentKeysPush0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentKeysPush0001";
        console.log(TAG + " start");
        expect(await runTest(makeArray(100000), keysTraverse, modPushForKeys)).assertTrue();
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_CFM_1300
     * @tc.name      testArrayConcurrentKeysSplice0001
     * @tc.desc      Verify concurrent splice during keys traversal triggers 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentKeysSplice0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentKeysSplice0001";
        console.log(TAG + " start");
        expect(await runTest(makeArray(100000), keysTraverse, modSplice)).assertTrue();
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_CFM_1400
     * @tc.name      testArrayConcurrentValuesPush0001
     * @tc.desc      Verify concurrent push during values traversal triggers 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentValuesPush0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentValuesPush0001";
        console.log(TAG + " start");
        expect(await runTest(makeArray(100000), valuesTraverse, modPush)).assertTrue();
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_CFM_1500
     * @tc.name      testArrayConcurrentValuesFill0001
     * @tc.desc      Verify concurrent fill during values traversal triggers 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentValuesFill0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentValuesFill0001";
        console.log(TAG + " start");
        expect(await runTest(makeArray(100000), valuesTraverse, modFill)).assertTrue();
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });
  });
}
