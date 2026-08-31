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

import { collections, taskpool, worker, MessageEvents, ArkTSUtils } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {CrossThreadApiResult} from './common'

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

@Concurrent
function containsAllRace(array: collections.Array<number>, elements: collections.Array<number>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      array.containsAll(elements);
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

class ArrayContainsAllMessage {
  arr?: Object;
  elements?: Object;
}

@Concurrent
async function lockedContainsAllTask(array: collections.Array<number>, elements: collections.Array<number>,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    let errorCode: number = 0;
    try {
      array.containsAll(elements);
    } catch (error) {
      errorCode = -1;
    }
    return errorCode;
  });
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

@Concurrent
function crossThreadApisTask(array: collections.Array<number>,
  elements: collections.Array<number>): CrossThreadApiResult {
  const result: CrossThreadApiResult = new CrossThreadApiResult();
  result.containsAllResult = array.containsAll(elements);
  result.retainAllResult = array.retainAll(elements);
  result.retainAllPredicateResult = array.retainAll((value: number): boolean => value >= 2);
  result.finalLength = array.length;
  return result;
}

function executeArrayContainsAllWorker(array: collections.Array<number>,
  elements: collections.Array<number>): Promise<boolean> {
  return new Promise<boolean>((resolve: (value: boolean) => void,
    reject: (reason: Error) => void): void => {
    const workerInstance: worker.ThreadWorker =
      new worker.ThreadWorker("./workers/ArrayContainsAllWorker");
    let settled: boolean = false;
    const msg: ArrayContainsAllMessage = new ArrayContainsAllMessage();
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
        reject(new Error("ArrayContainsAllWorker error"));
      }
      workerInstance.terminate();
    };
    workerInstance.postMessage(msg);
  });
}

export default function CollectionsArrayContainsAllSendableTest(): void {
  describe('CollectionsArrayContainsAllSendableTest', (): void => {
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
     * @tc.name   collectionsArrayContainsAllTest1100
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_1100
     * @tc.desc   Verify containsAll read and retainAll write with AsyncLock in multi-thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayContainsAllTest1100';
        console.info(`${caseName}, test start`);
        try {
          const sharedArray: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 0; i < 20; i++) {
            sharedArray.push(i);
          }
          const sharedElements: collections.Array<number> = new collections.Array<number>(0, 1, 2);
          const noLockPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
          for (let i: number = 0; i < 5; i++) {
            noLockPromises.push(taskpool.execute(containsAllRace, sharedArray, sharedElements));
          }
          for (let i: number = 0; i < 2; i++) {
            noLockPromises.push(taskpool.execute(retainAllElementRace, sharedArray, sharedElements));
          }
          for (let i: number = 0; i < noLockPromises.length; i++) {
            const code: number = await noLockPromises[i] as number;
            expect(code === 0 || code === 10200201).assertEqual(true);
          }
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const lockedArray: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 0; i < 20; i++) {
            lockedArray.push(i);
          }
          const lockedElements: collections.Array<number> = new collections.Array<number>(0, 1, 2);
          const lockPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
          for (let i: number = 0; i < 5; i++) {
            lockPromises.push(taskpool.execute(lockedContainsAllTask, lockedArray, lockedElements, lock));
          }
          for (let i: number = 0; i < 2; i++) {
            lockPromises.push(taskpool.execute(lockedRetainAllElementsTask, lockedArray, lockedElements, lock));
          }
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
     * @tc.name   collectionsArrayContainsAllTest1200
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_1200
     * @tc.desc   Verify @Sendable Array cross TaskPool transfer and call three new APIs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayContainsAllTest1200';
        console.info(`${caseName}, test start`);
        try {
          const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
          const elements: collections.Array<number> = new collections.Array<number>(1, 2, 3);
          const result: CrossThreadApiResult =
            await taskpool.execute(crossThreadApisTask, arr, elements) as CrossThreadApiResult;
          expect(result.containsAllResult).assertEqual(true);
          expect(result.retainAllResult).assertEqual(true);
          expect(result.retainAllPredicateResult).assertEqual(true);
          expect(result.finalLength).assertEqual(2);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest1300
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_1300
     * @tc.desc   Verify Worker receives Array and calls containsAll correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayContainsAllTest1300';
        console.info(`${caseName}, test start`);
        try {
          const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
          const elements: collections.Array<number> = new collections.Array<number>(1, 2, 3);
          const result1: boolean = await executeArrayContainsAllWorker(arr, elements);
          expect(result1).assertEqual(true);
          const arr2: collections.Array<number> = new collections.Array<number>(1, 2);
          const elements2: collections.Array<number> = new collections.Array<number>(1, 2, 3);
          const result2: boolean = await executeArrayContainsAllWorker(arr2, elements2);
          expect(result2).assertEqual(false);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest1400
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_1400
     * @tc.desc   Verify collections.Array instanceof and method availability.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest1400';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(arr instanceof collections.Array).assertEqual(true);
        expect(arr.containsAll !== undefined).assertEqual(true);
        expect(arr.retainAll !== undefined).assertEqual(true);
        expect(arr.length).assertEqual(3);
        const elements: collections.Array<number> = new collections.Array<number>(1, 2);
        expect(arr.containsAll(elements)).assertEqual(true);
        arr.retainAll(elements);
        expect(arr.length).assertEqual(2);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest1500
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_1500
     * @tc.desc   Verify containsAll at 1023/1024/1025 element boundaries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest1500';
        console.info(`${caseName}, test start`);
        for (let n: number = 1023; n <= 1025; n++) {
          const arr: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 0; i < n; i++) {
            arr.push(i);
          }
          const mid: number = Math.floor(n / 2);
          const elements: collections.Array<number> = new collections.Array<number>(0, mid, n - 1);
          expect(arr.containsAll(elements)).assertEqual(true);
          expect(arr.length).assertEqual(n);
          const notFound: collections.Array<number> = new collections.Array<number>(n);
          expect(arr.containsAll(notFound)).assertEqual(false);
          const emptyElements: collections.Array<number> = new collections.Array<number>();
          expect(arr.containsAll(emptyElements)).assertEqual(true);
        }
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest1600
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_1600
     * @tc.desc   Verify containsAll on empty container with various element inputs.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest1600';
        console.info(`${caseName}, test start`);
        const emptyArr: collections.Array<number> = new collections.Array<number>();
        const emptyElements: collections.Array<number> = new collections.Array<number>();
        expect(emptyArr.containsAll(emptyElements)).assertEqual(true);
        expect(emptyArr.length).assertEqual(0);
        const nonEmptyElements: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(emptyArr.containsAll(nonEmptyElements)).assertEqual(false);
        expect(emptyArr.containsAll(emptyArr)).assertEqual(true);
        const nonEmptyArr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(nonEmptyArr.containsAll(emptyElements)).assertEqual(true);
        expect(emptyArr.at(0)).assertEqual(undefined);
        expect(emptyArr.indexOf(0)).assertEqual(-1);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest1700
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_1700
     * @tc.desc   Verify containsAll SameValueZero NaN equality with collections.Array input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest1700';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<number> = new collections.Array<number>(NaN, 1, 2);
        const elements: collections.Array<number> = new collections.Array<number>(NaN);
        expect(arr.containsAll(elements)).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest1800
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_1800
     * @tc.desc   Verify containsAll SameValueZero positive/negative zero equality with collections.Array input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest1800';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<number> = new collections.Array<number>(+0, 1, 2);
        const elements: collections.Array<number> = new collections.Array<number>(-0);
        expect(arr.containsAll(elements)).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest1900
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_1900
     * @tc.desc   Verify containsAll does not convert types with collections.Array input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest1900';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<number | string> = new collections.Array<number | string>(1, '2');
        const elements: collections.Array<number | string> = new collections.Array<number | string>('1');
        expect(arr.containsAll(elements)).assertEqual(false);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest2000
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_2000
     * @tc.desc   Verify containsAll reference equality with collections.Array input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest2000';
        console.info(`${caseName}, test start`);
        const ref: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        const arr: collections.Array<collections.Array<number>> =
          new collections.Array<collections.Array<number>>(ref);
        const elements: collections.Array<collections.Array<number>> =
          new collections.Array<collections.Array<number>>(ref);
        expect(arr.containsAll(elements)).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest2100
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_2100
     * @tc.desc   Verify containsAll does not compare structurally with collections.Array input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest2100';
        console.info(`${caseName}, test start`);
        const ref1: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        const ref2: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        const arr: collections.Array<collections.Array<number>> =
          new collections.Array<collections.Array<number>>(ref1);
        const elements: collections.Array<collections.Array<number>> =
          new collections.Array<collections.Array<number>>(ref2);
        expect(arr.containsAll(elements)).assertEqual(false);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest2200
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_2200
     * @tc.desc   Verify containsAll null equality with collections.Array input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest2200';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<number | null> = new collections.Array<number | null>(null, 1);
        const elements: collections.Array<number | null> = new collections.Array<number | null>(null);
        expect(arr.containsAll(elements)).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest2300
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_2300
     * @tc.desc   Verify containsAll boolean equality with collections.Array input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest2300';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<boolean> = new collections.Array<boolean>(true, false);
        const elements: collections.Array<boolean> = new collections.Array<boolean>(true);
        expect(arr.containsAll(elements)).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest2400
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_2400
     * @tc.desc   Verify containsAll string equality with collections.Array input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest2400';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<string> = new collections.Array<string>('hello', 'world');
        const elements: collections.Array<string> = new collections.Array<string>('hello');
        expect(arr.containsAll(elements)).assertEqual(true);
        console.info(`${caseName}, test end`);
      });


    /**
     * @tc.name   collectionsArrayContainsAllTest2600
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_2600
     * @tc.desc   Verify ConcurrentApiScope is released after exception, no residual lock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest2600';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        const elements: collections.Array<number> = new collections.Array<number>(2, 3, 4);
        let thrown: boolean = false;
        try {
          arr.retainAll((value: number): boolean => {
            arr.containsAll(elements);
            return true;
          });
          expect(true).assertFail();
        } catch (error) {
          thrown = true;
          expect(error.code).assertEqual(10200201);
        }
        expect(thrown).assertEqual(true);
        expect(arr.containsAll(elements)).assertEqual(true);
        expect(arr.length).assertEqual(5);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest2700
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_2700
     * @tc.desc   Verify fail-fast mechanism: no deadlock and no duplicate callback on reentrant conflict.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest2700';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        const elements: collections.Array<number> = new collections.Array<number>(1, 2);
        let callCount: number = 0;
        let thrown: boolean = false;
        try {
          arr.retainAll((value: number): boolean => {
            callCount++;
            arr.containsAll(elements);
            return true;
          });
          expect(true).assertFail();
        } catch (error) {
          thrown = true;
          expect(error.code).assertEqual(10200201);
        }
        expect(thrown).assertEqual(true);
        expect(callCount).assertEqual(1);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest2900
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_2900
     * @tc.desc   Verify concurrent modification error code 10200201 and message for containsAll.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest2900';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        const elements: collections.Array<number> = new collections.Array<number>(1, 2);
        let thrown: boolean = false;
        try {
          arr.retainAll((value: number): boolean => {
            arr.containsAll(elements);
            return true;
          });
          expect(true).assertFail();
        } catch (error) {
          thrown = true;
          expect(error.code).assertEqual(10200201);
          expect(error.message).assertEqual('Concurrent modification exception');
        }
        expect(thrown).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest3000
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_3000
     * @tc.desc   Verify containsAll returns true when all elements are contained (TC-DT-001).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest3000';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 3);
        expect(receiver.containsAll(new collections.Array<number>(1, 3))).assertEqual(true);
        expect(receiver.containsAll(new collections.Array<number>(1, 2, 3))).assertEqual(true);
        expect(receiver.containsAll(new collections.Array<number>(3, 2, 2, 1))).assertEqual(true);
        expect(receiver.length).assertEqual(4);
        expect(receiver.at(0)).assertEqual(1);
        expect(receiver.at(1)).assertEqual(2);
        expect(receiver.at(2)).assertEqual(3);
        expect(receiver.at(3)).assertEqual(3);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest3100
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_3100
     * @tc.desc   Verify containsAll returns false when some elements are not contained (TC-DT-002).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest3100';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 3);
        expect(receiver.containsAll(new collections.Array<number>(1, 4))).assertEqual(false);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest3300
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_3300
      * @tc.desc   Verify containsAll returns true with different order (element-wise check: each element must exist in receiver).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest3300';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(receiver.containsAll(new collections.Array<number>(3, 1, 2))).assertEqual(true);
        expect(receiver.containsAll(new collections.Array<number>(2, 3, 1))).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest3400
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_3400
     * @tc.desc   Verify containsAll returns true when elements has duplicates all in receiver.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest3400';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        expect(receiver.containsAll(new collections.Array<number>(1, 1, 2, 2, 3, 3))).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest3500
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_3500
     * @tc.desc   Verify containsAll returns false when elements has duplicates but some not in receiver.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest3500';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2);
        expect(receiver.containsAll(new collections.Array<number>(1, 1, 3))).assertEqual(false);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest3600
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_3600
     * @tc.desc   Verify containsAll returns true when elements longer than receiver but all contained.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest3600';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1);
        expect(receiver.containsAll(new collections.Array<number>(1, 1, 1, 1))).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest3700
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_3700
     * @tc.desc   Verify containsAll returns true when receiver has duplicate elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest3700';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 1, 2, 2);
        expect(receiver.containsAll(new collections.Array<number>(1, 2))).assertEqual(true);
        expect(receiver.containsAll(new collections.Array<number>(1, 1, 2, 2))).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest3800
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_3800
     * @tc.desc   Verify containsAll with consecutive duplicate elements in collections.Array input.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest3800';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 1, 1, 1, 2, 2, 2, 2);
        expect(receiver.containsAll(new collections.Array<number>(1, 1, 1, 1, 1))).assertEqual(true);
        expect(receiver.containsAll(new collections.Array<number>(2, 2, 2, 2, 2, 2))).assertEqual(true);
        expect(receiver.containsAll(new collections.Array<number>(1, 2, 1, 2, 1, 2))).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest4000
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_4000
     * @tc.desc   Verify containsAll with 10250 elements, collections.Array input, all contained.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest4000';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 10250; i++) {
          receiver.push(i);
        }
        expect(receiver.containsAll(new collections.Array<number>(0, 5125, 10249))).assertEqual(true);
        expect(receiver.containsAll(new collections.Array<number>(1, 2, 3, 65534, 10249))).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayContainsAllTest4200
     * @tc.number SUB_COLLECTIONS_ARRAY_CONTAINS_ALL_4200
     * @tc.desc   Verify containsAll with 10250 elements, collections.Array input, some not contained.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayContainsAllTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayContainsAllTest4200';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 10250; i++) {
          receiver.push(i);
        }
        expect(receiver.containsAll(new collections.Array<number>(0, 10250))).assertEqual(false);
        expect(receiver.containsAll(new collections.Array<number>(10249, 10250, 10251))).assertEqual(false);
        console.info(`${caseName}, test end`);
      });
  });
}
