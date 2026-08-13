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
import { createSharedBarrier, waitAtSharedBarrier, createSharedSignal, notifySharedSignal, waitForSharedSignal } from "../SharedLock";

@Concurrent
async function noLockEntries(arr: collections.Array<number>, barrier: SharedArrayBuffer, handshake: SharedArrayBuffer): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  try {
    let count: number = 0;
    const iterator: IterableIterator<[number, number]> = arr.entries();
    let entry: IteratorResult<[number, number]> = iterator.next();
    notifySharedSignal(handshake, 0);
    while (!entry.done) { count++; entry = iterator.next(); }
    return "success";
  } catch (err) {
    const e: string = JSON.stringify(err);
    if (e.indexOf("10200201") >= 0) { return "error:10200201"; }
    return "error:unknown";
  }
}

@Concurrent
async function noLockSplice(arr: collections.Array<number>, barrier: SharedArrayBuffer, handshake: SharedArrayBuffer): Promise<string> {
  waitAtSharedBarrier(barrier, 2);
  waitForSharedSignal(handshake, 0, 5000);
  try { arr.splice(10, 5); return "success"; }
  catch (err) { const e: string = JSON.stringify(err); if (e.indexOf("10200201") >= 0) { return "error:10200201"; } return "error:unknown"; }
}

function makeArray(count: number): collections.Array<number> {
  const arr: collections.Array<number> = new collections.Array<number>();
  for (let i: number = 0; i < count; i++) { arr.push(i); }
  return arr;
}

async function runNoLockTest(arr: collections.Array<number>, traverseTask: Function,
  modifyTask: Function): Promise<boolean> {
  const barrier: SharedArrayBuffer = createSharedBarrier();
  const handshake: SharedArrayBuffer = createSharedSignal(1);
  try {
    const results: Object[] = await Promise.all([
      taskpool.execute(traverseTask, arr, barrier, handshake),
      taskpool.execute(modifyTask, arr, barrier, handshake)
    ]);
    for (let i: number = 0; i < results.length; i++) {
      if ((results[i] as string).indexOf("error:10200201") >= 0) { return true; }
    }
  } catch (err) {
    if (JSON.stringify(err).indexOf("10200201") >= 0) { return true; }
  }
  return false;
}

export default function arrayConcurrentNoLockTest(): void {
  describe("arrayConcurrentNoLockTest", (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout((): void => { resolve(); }, 20);
      });
    });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_NOLOCK_0200
     * @tc.name      testArrayConcurrentNoLock0002
     * @tc.desc      Verify entries and splice without AsyncLock triggers
     *               concurrent modification error 10200201.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it("testArrayConcurrentNoLock0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentNoLock0002";
        console.log(TAG + " start");
        expect(await runNoLockTest(makeArray(100000), noLockEntries, noLockSplice)).assertTrue();
        console.log(TAG + " done"); done(); console.log(TAG + " end");
      });

  });
}
