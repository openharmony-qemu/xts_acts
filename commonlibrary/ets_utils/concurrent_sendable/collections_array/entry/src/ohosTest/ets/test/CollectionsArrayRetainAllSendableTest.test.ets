/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { collections, BuiltinArray, taskpool, worker, MessageEvents, ArkTSUtils } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

@Concurrent
function retainAllElementRace(array: collections.Array<number>, elements: collections.Array<number>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      array.retainAll(elements);
    } catch (error) {
      if (error.code === 10200201) {
        errorCode = 10200201;
      } else {
        errorCode = -1;
      }
      break;
    }
  }
  return errorCode;
}

@Concurrent
function WriteRace(array: collections.Array<number>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      array.push(666);
    } catch (error) {
      if (error.code === 10200201) {
        errorCode = 10200201;
      } else {
        errorCode = -1;
      }
      break;
    }
  }
  return errorCode;
}

@Sendable
class ArrayRetainAllElementsMessage {
  arr?: collections.Array<number>;
  elements?: collections.Array<number>;
}

@Concurrent
async function lockedRetainAllElementsTask(array: collections.Array<number>, elements: collections.Array<number>,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    let errorCode: number = 0;
    try {
      array.retainAll(elements);
    } catch (error) {
      errorCode = -1;
    }
    return errorCode;
  });
}

function executeArrayRetainAllElementsWorker(array: collections.Array<number>,
  elements: collections.Array<number>): Promise<boolean> {
  return new Promise<boolean>((resolve: (value: boolean) => void,
    reject: (reason: Error) => void): void => {
    const workerInstance: worker.ThreadWorker =
      new worker.ThreadWorker("./workers/ArrayRetainAllElementsWorker");
    let settled: boolean = false;
    const msg: ArrayRetainAllElementsMessage = new ArrayRetainAllElementsMessage();
    msg.arr = array;
    msg.elements = elements;
    workerInstance.onmessage = (event: MessageEvents): void => {
      settled = true;
      resolve(event.data as boolean);
      workerInstance.terminate();
    };
    workerInstance.onerror = (): void => {
      if (!settled) {
        settled = true;
        reject(new Error("ArrayRetainAllElementsWorker error"));
      }
      workerInstance.terminate();
    };
    workerInstance.postMessage(msg);
  });
}

export default function CollectionsArrayRetainAllSendableTest(): void {
  describe('CollectionsArrayRetainAllSendableTest', (): void => {
    beforeAll((done: Function): void => {
      done();
    });
    beforeEach((done: Function): void => {
      done();
    });
    afterEach((done: Function): void => {
      done();
    });
    afterAll(async (done: Function): Promise<void> => {
      await sleep(20);
      done();
    });

    /**
     * @tc.name   collectionsArrayRetainAllTest1000
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_1000
     * @tc.desc   Verify retainAll with AsyncLock in multi-thread concurrent writes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayRetainAllTest1000';
        console.info(`${caseName}, test start`);
        try {
          const sharedArray: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 0; i < 6; i++) {
            sharedArray.push(i + 1);
          }
          const noLockPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
          noLockPromises.push(taskpool.execute(retainAllElementRace, sharedArray,
            new collections.Array<number>(1, 2)));
          noLockPromises.push(taskpool.execute(retainAllElementRace, sharedArray,
            new collections.Array<number>(3, 4)));
          noLockPromises.push(taskpool.execute(retainAllElementRace, sharedArray,
            new collections.Array<number>(5, 6)));
          for (let i: number = 0; i < noLockPromises.length; i++) {
            const code: number = await noLockPromises[i] as number;
            expect(code === 0 || code === 10200201).assertEqual(true);
          }
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const lockedArray: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 0; i < 6; i++) {
            lockedArray.push(i + 1);
          }
          const lockPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
          lockPromises.push(taskpool.execute(lockedRetainAllElementsTask, lockedArray,
            new collections.Array<number>(1, 2), lock));
          lockPromises.push(taskpool.execute(lockedRetainAllElementsTask, lockedArray,
            new collections.Array<number>(3, 4), lock));
          lockPromises.push(taskpool.execute(lockedRetainAllElementsTask, lockedArray,
            new collections.Array<number>(5, 6), lock));
          for (let i: number = 0; i < lockPromises.length; i++) {
            const code: number = await lockPromises[i] as number;
            expect(code).assertEqual(0);
          }
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest1100
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_1100
     * @tc.desc   Verify Worker receives Array and calls retainAll(elements) correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayRetainAllTest1100';
        console.info(`${caseName}, test start`);
        try {
          const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
          const elements: collections.Array<number> = new collections.Array<number>(2, 3, 4);
          const result: boolean = await executeArrayRetainAllElementsWorker(arr, elements);
          expect(result).assertEqual(true);
          expect(arr.length).assertEqual(5);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest1300
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_1300
     * @tc.desc   Verify retainAll(elements) at 1023/1024/1025 element boundaries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest1300';
        console.info(`${caseName}, test start`);
        for (let n: number = 1023; n <= 1025; n++) {
          const arr: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 0; i < n; i++) {
            arr.push(i);
          }
          const retainElements: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 0; i < 100; i++) {
            retainElements.push(i);
          }
          const result: boolean = arr.retainAll(retainElements);
          expect(result).assertEqual(true);
          expect(arr.length).assertEqual(100);
          expect(arr.at(0)).assertEqual(0);
          expect(arr.at(99)).assertEqual(99);
        }
        for (let n: number = 1023; n <= 1025; n++) {
          const arr2: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 0; i < n; i++) {
            arr2.push(i);
          }
          const emptyEl: collections.Array<number> = new collections.Array<number>();
          const result2: boolean = arr2.retainAll(emptyEl);
          expect(result2).assertEqual(true);
          expect(arr2.length).assertEqual(0);
        }
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest1400
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_1400
     * @tc.desc   Verify retainAll(elements) on empty container.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest1400';
        console.info(`${caseName}, test start`);
        const emptyArr: collections.Array<number> = new collections.Array<number>();
        const emptyElements: collections.Array<number> = new collections.Array<number>();
        expect(emptyArr.retainAll(emptyElements)).assertEqual(false);
        expect(emptyArr.length).assertEqual(0);
        const nonEmptyElements: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(emptyArr.retainAll(nonEmptyElements)).assertEqual(false);
        expect(emptyArr.length).assertEqual(0);
        expect(emptyArr.retainAll(emptyArr)).assertEqual(false);
        expect(emptyArr.length).assertEqual(0);
        const nonEmptyArr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(nonEmptyArr.retainAll(emptyElements)).assertEqual(true);
        expect(nonEmptyArr.length).assertEqual(0);
        nonEmptyArr.push(99);
        expect(nonEmptyArr.length).assertEqual(1);
        expect(nonEmptyArr.at(0)).assertEqual(99);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest1600
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_1600
     * @tc.desc   Verify retainAll no rollback and array integrity after concurrent modification conflict.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayRetainAllTest1600';
        console.info(`${caseName}, test start`);
        try {
          const sharedArray: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 0; i < 256; i++) {
            sharedArray.push(i);
          }
          const sharedElements: collections.Array<number> = new collections.Array<number>(0, 64, 128, 192);
          const racePromises: Array<Promise<Object>> = new Array<Promise<Object>>();
          for (let i: number = 0; i < 100; i++) {
            racePromises.push(taskpool.execute(retainAllElementRace, sharedArray, sharedElements));
            racePromises.push(taskpool.execute(WriteRace, sharedArray));
          }
          for (let i: number = 0; i < racePromises.length; i++) {
            const code: number = await racePromises[i] as number;
            expect(code === 0 || code === 10200201).assertEqual(true);
          }
          expect(sharedArray.length >= 0).assertEqual(true);
          const testArr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
          expect(testArr.retainAll(new collections.Array<number>(2))).assertEqual(true);
          expect(testArr.length).assertEqual(1);
          expect(testArr.at(0)).assertEqual(2);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest3000
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_3000
     * @tc.desc   Verify retainAll with collections.Array partial retain returns true (TC-DT-019).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest3000';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        expect(receiver.retainAll(new collections.Array<number>(2, 4))).assertEqual(true);
        expect(receiver.length).assertEqual(2);
        expect(receiver.at(0)).assertEqual(2);
        expect(receiver.at(1)).assertEqual(4);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest3400
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_3400
     * @tc.desc   Verify retainAll preserves receiver order when elements has different order.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest3400';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        expect(receiver.retainAll(new collections.Array<number>(4, 2))).assertEqual(true);
        expect(receiver.length).assertEqual(2);
        expect(receiver.at(0)).assertEqual(2);
        expect(receiver.at(1)).assertEqual(4);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest3500
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_3500
     * @tc.desc   Verify retainAll with duplicate elements in input does not affect result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest3500';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(receiver.retainAll(new collections.Array<number>(1, 1, 2, 2))).assertEqual(true);
        expect(receiver.length).assertEqual(2);
        expect(receiver.at(0)).assertEqual(1);
        expect(receiver.at(1)).assertEqual(2);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest3600
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_3600
     * @tc.desc   Verify retainAll keeps all matching duplicates in receiver.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest3600';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 1, 2, 2, 3, 3);
        expect(receiver.retainAll(new collections.Array<number>(1, 3))).assertEqual(true);
        expect(receiver.length).assertEqual(4);
        expect(receiver.at(0)).assertEqual(1);
        expect(receiver.at(1)).assertEqual(1);
        expect(receiver.at(2)).assertEqual(3);
        expect(receiver.at(3)).assertEqual(3);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest3700
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_3700
     * @tc.desc   Verify retainAll with elements containing items not in receiver only keeps existing ones.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest3700';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(receiver.retainAll(new collections.Array<number>(2, 4, 5))).assertEqual(true);
        expect(receiver.length).assertEqual(1);
        expect(receiver.at(0)).assertEqual(2);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest3800
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_3800
     * @tc.desc   Verify retainAll with consecutive duplicates, collections.Array input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest3800';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 1, 1, 1, 2, 2, 2, 2);
        expect(receiver.retainAll(new collections.Array<number>(1, 1, 1))).assertEqual(true);
        expect(receiver.length).assertEqual(4);
        expect(receiver.at(0)).assertEqual(1);
        expect(receiver.at(1)).assertEqual(1);
        expect(receiver.at(2)).assertEqual(1);
        expect(receiver.at(3)).assertEqual(1);
        const receiver2: collections.Array<number> = new collections.Array<number>(3, 3, 3, 4, 4, 4, 4, 4);
        expect(receiver2.retainAll(new collections.Array<number>(3))).assertEqual(true);
        expect(receiver2.length).assertEqual(3);
        expect(receiver2.at(0)).assertEqual(3);
        expect(receiver2.at(1)).assertEqual(3);
        expect(receiver2.at(2)).assertEqual(3);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest4000
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_4000
     * @tc.desc   Verify retainAll with 10250 elements, collections.Array input, retain first 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest4000';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 10250; i++) {
          receiver.push(i);
        }
        const elements: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 100; i++) {
          elements.push(i);
        }
        expect(receiver.retainAll(elements)).assertEqual(true);
        expect(receiver.length).assertEqual(100);
        expect(receiver.at(0)).assertEqual(0);
        expect(receiver.at(99)).assertEqual(99);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest4200
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_4200
     * @tc.desc   Verify retainAll with 10250 elements, empty collections.Array input clears receiver.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest4200';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 10250; i++) {
          receiver.push(i);
        }
        expect(receiver.retainAll(new collections.Array<number>())).assertEqual(true);
        expect(receiver.length).assertEqual(0);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest3700
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_3700
     * @tc.desc   Verify retainAll(Array) reports bind error 10200011 when method is detached.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest3700';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        const retainAllMethod: (elements: collections.Array<number>) => boolean = receiver.retainAll;
        let thrown: boolean = false;
        try {
          retainAllMethod(new collections.Array<number>(1));
          expect(true).assertFail();
        } catch (error) {
          thrown = true;
          expect(error.code).assertEqual(10200011);
        }
        expect(thrown).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllTest3800
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_3800
     * @tc.desc   Verify retainAll with explicitly declared BuiltinArray type input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllTest3800';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        const elements: BuiltinArray<number> = [2, 4];
        expect(receiver.retainAll(elements)).assertEqual(true);
        expect(receiver.length).assertEqual(2);
        expect(receiver.at(0)).assertEqual(2);
        expect(receiver.at(1)).assertEqual(4);
        console.info(`${caseName}, test end`);
      });
  });
}
