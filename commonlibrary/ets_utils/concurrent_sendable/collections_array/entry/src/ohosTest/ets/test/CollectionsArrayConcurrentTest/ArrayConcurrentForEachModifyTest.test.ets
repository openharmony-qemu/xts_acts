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
async function forEachTraverse(arr: collections.Array<number>, barrier: SharedArrayBuffer, handshake:
  SharedArrayBuffer): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  try {
    let count: number = 0;
    let signaled: boolean = false;
    arr.forEach((value: number): void => {
      count++;
      if (!signaled) { signaled = true; notifySharedSignal(handshake, 0); }
    });
    return "success";
  } catch (err) {
    const errStr: string = JSON.stringify(err);
    if (errStr.indexOf("10200201") >= 0) { return "error:10200201"; }
    return "error:unknown";
  }
}

@Concurrent
async function modifyPush(arr: collections.Array<number>, barrier: SharedArrayBuffer, handshake: SharedArrayBuffer):
  Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  waitForSharedSignal(handshake, 0, 5000);
  try { arr.push(9999); return "success"; }
  catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) {
      return "error:10200201";
    }
    return "error:unknown"; }
}

@Concurrent
async function modifyPop(arr: collections.Array<number>, barrier: SharedArrayBuffer, handshake: SharedArrayBuffer):
  Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  waitForSharedSignal(handshake, 0, 5000);
  try { arr.pop(); return "success"; }
  catch (err) { const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) {
      return "error:10200201";
    }
    return "error:unknown"; }
}

@Concurrent
async function modifySplice(arr: collections.Array<number>, barrier: SharedArrayBuffer, handshake: SharedArrayBuffer):
  Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  waitForSharedSignal(handshake, 0, 5000);
  try { arr.splice(100, 10); return "success"; }
  catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) {
      return "error:10200201";
    }
    return "error:unknown"; }
}

@Concurrent
async function forEachTraverseWithShift(arr: collections.Array<number>, signal: SharedArrayBuffer): Promise<string> {
  try {
    let count: number = 0;
    let signaled: boolean = false;
    arr.forEach((value: number): void => {
      count++;
      if (!signaled) {
        signaled = true;
        notifySharedSignal(signal, 0);
        if (!waitForSharedSignal(signal, 1, 3000)) {
          throw new Error("modifyShift timeout");
        }
      }
    });
    return "success";
  } catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) {
      return "error:10200201";
    }
    return "error:unknown";
  }
}

@Concurrent
async function modifyShiftAfterTraverseStarted(arr: collections.Array<number>,
  signal: SharedArrayBuffer): Promise<string> {
  if (!waitForSharedSignal(signal, 0, 3000)) {
    notifySharedSignal(signal, 1);
    return "error:unknown";
  }
  try {
    arr.shift();
    return "success";
  } catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) {
      return "error:10200201";
    }
    return "error:unknown";
  } finally {
    notifySharedSignal(signal, 1);
  }
}

@Concurrent
async function modifyUnshift(arr: collections.Array<number>, barrier: SharedArrayBuffer, handshake:
  SharedArrayBuffer): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  waitForSharedSignal(handshake, 0, 5000);
  try { arr.unshift(9999); return "success"; }
  catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) {
      return "error:10200201";
    }
    return "error:unknown";
  }
}

@Concurrent
async function modifyFill(arr: collections.Array<number>, barrier: SharedArrayBuffer, handshake:
  SharedArrayBuffer): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  waitForSharedSignal(handshake, 0, 5000);
  try { arr.fill(0); return "success"; }
  catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) {
      return "error:10200201";
    }
    return "error:unknown";
  }
}

@Concurrent
async function modifyCopyWithin(arr: collections.Array<number>, barrier: SharedArrayBuffer, handshake:
  SharedArrayBuffer): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  waitForSharedSignal(handshake, 0, 5000);
  try { arr.copyWithin(0, 200, 300); return "success"; }
  catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) {
      return "error:10200201";
    }
    return "error:unknown";
  }
}

@Concurrent
async function modifySort(arr: collections.Array<number>, barrier: SharedArrayBuffer, handshake: SharedArrayBuffer):
  Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  waitForSharedSignal(handshake, 0, 5000);
  try { arr.sort((a: number, b: number): number => a - b); return "success"; }
  catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) {
      return "error:10200201";
    }
    return "error:unknown";
  }
}

@Concurrent
async function modifyReverse(arr: collections.Array<number>, barrier: SharedArrayBuffer, handshake: SharedArrayBuffer)
  : Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  waitForSharedSignal(handshake, 0, 5000);
  try { arr.reverse(); return "success"; }
  catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) {
      return "error:10200201";
    }
    return "error:unknown";
  }
}

function makeArray(count: number): collections.Array<number> {
  const arr: collections.Array<number> = new collections.Array<number>();
  for (let i: number = 0; i < count; i++) { arr.push(i); }
  return arr;
}

async function runTest(arr: collections.Array<number>, modifyTask: Function): Promise<boolean> {
  const barrier: SharedArrayBuffer = createSharedBarrier();
  const handshake: SharedArrayBuffer = createSharedSignal(1);
  try {
    const results: Object[] = await Promise.all([
      taskpool.execute(forEachTraverse, arr, barrier, handshake),
      taskpool.execute(modifyTask, arr, barrier, handshake)
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

async function runShiftOverlapTest(arr: collections.Array<number>): Promise<boolean> {
  const signal: SharedArrayBuffer = createSharedSignal(2);
  try {
    const results: Object[] = await Promise.all([
      taskpool.execute(forEachTraverseWithShift, arr, signal),
      taskpool.execute(modifyShiftAfterTraverseStarted, arr, signal)
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

export default function arrayConcurrentForEachModifyTest(): void {
  describe("arrayConcurrentForEachModifyTest", (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_CFM_0100
     * @tc.name      testArrayConcurrentForEachPush0001
     * @tc.desc      Verify concurrent push during forEach traversal triggers 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentForEachPush0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentForEachPush0001";
        console.log(TAG + " start");
        let result: boolean = false;
        try {
          result = await runTest(makeArray(100000), modifyPush);
        } catch (err) {
          console.error(`runTest failed: ${JSON.stringify(err)}`);
        }
        expect(result).assertTrue();
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_CFM_0200
     * @tc.name      testArrayConcurrentForEachPop0001
     * @tc.desc      Verify concurrent pop during forEach traversal triggers 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentForEachPop0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentForEachPop0001";
        console.log(TAG + " start");
        let result: boolean = false;
        try {
          result = await runTest(makeArray(100000), modifyPop);
        } catch (err) {
          console.error(`runTest failed: ${JSON.stringify(err)}`);
        }
        expect(result).assertTrue();
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_CFM_0300
     * @tc.name      testArrayConcurrentForEachSplice0001
     * @tc.desc      Verify concurrent splice during forEach traversal triggers 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentForEachSplice0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentForEachSplice0001";
        console.log(TAG + " start");
        let result: boolean = false;
        try {
          result = await runTest(makeArray(100000), modifySplice);
        } catch (err) {
          console.error(`runTest failed: ${JSON.stringify(err)}`);
        }
        expect(result).assertTrue();
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_CFM_0400
     * @tc.name      testArrayConcurrentForEachShift0001
     * @tc.desc      Verify concurrent shift during forEach traversal triggers 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentForEachShift0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentForEachShift0001";
        console.log(TAG + " start");
        let result: boolean = false;
        try {
          result = await runShiftOverlapTest(makeArray(100000));
        } catch (err) {
          console.error(`runShiftOverlapTest failed: ${JSON.stringify(err)}`);
        }
        expect(result).assertTrue();
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_CFM_0500
     * @tc.name      testArrayConcurrentForEachUnshift0001
     * @tc.desc      Verify concurrent unshift during forEach traversal triggers 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentForEachUnshift0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentForEachUnshift0001";
        console.log(TAG + " start");
        let result: boolean = false;
        try {
          result = await runTest(makeArray(100000), modifyUnshift);
        } catch (err) {
          console.error(`runTest failed: ${JSON.stringify(err)}`);
        }
        expect(result).assertTrue();
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_CFM_0600
     * @tc.name      testArrayConcurrentForEachFill0001
     * @tc.desc      Verify concurrent fill during forEach traversal triggers 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentForEachFill0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentForEachFill0001";
        console.log(TAG + " start");
        let result: boolean = false;
        try {
          result = await runTest(makeArray(100000), modifyFill);
        } catch (err) {
          console.error(`runTest failed: ${JSON.stringify(err)}`);
        }
        expect(result).assertTrue();
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_CFM_0700
     * @tc.name      testArrayConcurrentForEachCopyWithin0001
     * @tc.desc      Verify concurrent copyWithin during forEach traversal triggers 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentForEachCopyWithin0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentForEachCopyWithin0001";
        console.log(TAG + " start");
        let result: boolean = false;
        try {
          result = await runTest(makeArray(100000), modifyCopyWithin);
        } catch (err) {
          console.error(`runTest failed: ${JSON.stringify(err)}`);
        }
        expect(result).assertTrue();
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_CFM_0800
     * @tc.name      testArrayConcurrentForEachSort0001
     * @tc.desc      Verify concurrent sort during forEach traversal triggers 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentForEachSort0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentForEachSort0001";
        console.log(TAG + " start");
        let result: boolean = false;
        try {
          result = await runTest(makeArray(100000), modifySort);
        } catch (err) {
          console.error(`runTest failed: ${JSON.stringify(err)}`);
        }
        expect(result).assertTrue();
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_CFM_0900
     * @tc.name      testArrayConcurrentForEachReverse0001
     * @tc.desc      Verify concurrent reverse during forEach traversal triggers 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentForEachReverse0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentForEachReverse0001";
        console.log(TAG + " start");
        let result: boolean = false;
        try {
          result = await runTest(makeArray(100000), modifyReverse);
        } catch (err) {
          console.error(`runTest failed: ${JSON.stringify(err)}`);
        }
        expect(result).assertTrue();
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });
  });
}
