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
async function entriesTraverse(arr: collections.Array<number>): Promise<string> {
  try {
    let count: number = 0;
    const iterator: IterableIterator<[number, number]> = arr.entries();
    let entry: IteratorResult<[number, number]> = iterator.next();
    while (!entry.done) {
      count++;
      entry = iterator.next();
    }
    return "success";
  } catch (err) {
    const errStr: string = JSON.stringify(err);
    if (errStr.indexOf("10200201") >= 0) {
      return "error:10200201";
    }
    return "error:unknown";
  }
}

@Concurrent
async function valuesTraverse(arr: collections.Array<number>): Promise<string> {
  try {
    let count: number = 0;
    const iterator: IterableIterator<number> = arr.values();
    let val: IteratorResult<number> = iterator.next();
    while (!val.done) {
      count++;
      val = iterator.next();
    }
    return "success";
  } catch (err) {
    const errStr: string = JSON.stringify(err);
    if (errStr.indexOf("10200201") >= 0) {
      return "error:10200201";
    }
    return "error:unknown";
  }
}

@Concurrent
async function modifyFill(arr: collections.Array<number>): Promise<string> {
  let dummy: number = 0;
  for (let j: number = 0; j < 50000; j++) { dummy += j; }
  try {
    arr.fill(0);
    return "success";
  } catch (err) {
    const errStr: string = JSON.stringify(err);
    if (errStr.indexOf("10200201") >= 0) {
      return "error:10200201";
    }
    return "error:unknown";
  }
}

@Concurrent
async function modifyUnshift(arr: collections.Array<number>): Promise<string> {
  let dummy: number = 0;
  for (let j: number = 0; j < 50000; j++) { dummy += j; }
  try {
    arr.unshift(9999);
    return "success";
  } catch (err) {
    const errStr: string = JSON.stringify(err);
    if (errStr.indexOf("10200201") >= 0) {
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

async function runModifyTest(arr: collections.Array<number>,
  traverseTask: Function, modifyTask: Function): Promise<boolean> {
  try {
    const results: Object[] = await Promise.all([
      taskpool.execute(traverseTask, arr),
      taskpool.execute(modifyTask, arr)
    ]);
    for (let i: number = 0; i < results.length; i++) {
      if ((results[i] as string).indexOf("error:10200201") >= 0) {
        return true;
      }
    }
  } catch (err) {
    const errStr: string = JSON.stringify(err);
    if (errStr.indexOf("10200201") >= 0) {
      return true;
    }
  }
  return false;
}

export default function arrayConcurrentTraverseModifyTest(): void {
  describe("arrayConcurrentTraverseModifyTest", (): void => {
    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_TRAVMOD_0500
     * @tc.name      testArrayConcurrentEntriesModify0002
     * @tc.desc      Verify concurrent fill during entries traversal on collections.Array
     *               triggers concurrent modification error.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentEntriesModify0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentEntriesModify0002";
        console.log(TAG + " start");
        const arr: collections.Array<number> = makeArray(500000);
        const errorDetected: boolean =
          await runModifyTest(arr, entriesTraverse, modifyFill);
        expect(errorDetected).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });

    /**
     * @tc.number    SUB_COLLECTIONS_ARRAY_CONCURRENT_TRAVMOD_0600
     * @tc.name      testArrayConcurrentValuesModify0001
     * @tc.desc      Verify concurrent unshift during values traversal on collections.Array
     *               triggers concurrent modification error.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayConcurrentValuesModify0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = "testArrayConcurrentValuesModify0001";
        console.log(TAG + " start");
        const arr: collections.Array<number> = makeArray(500000);
        const errorDetected: boolean =
          await runModifyTest(arr, valuesTraverse, modifyUnshift);
        expect(errorDetected).assertTrue();
        console.log(TAG + " done");
        done();
        console.log(TAG + " end");
      });
  });
}
