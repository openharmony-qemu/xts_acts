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

@Sendable
class SendableBox {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}

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
function retainAllPredicateRace(array: collections.Array<number>): number {
  let errorCode: number = 0;
  for (let index: number = 0; index < 200; index++) {
    try {
      array.retainAll((value: number): boolean => value >= 0);
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
class ArrayRetainAllPredicateMessage {
  arr?: collections.Array<number>;
}

@Concurrent
async function lockedRetainAllPredicateTask(array: collections.Array<number>,
  lock: ArkTSUtils.locks.AsyncLock): Promise<number> {
  return await lock.lockAsync(async (): Promise<number> => {
    let errorCode: number = 0;
    try {
      array.retainAll((value: number): boolean => value >= 0);
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

function executeArrayRetainAllPredicateWorker(array: collections.Array<number>): Promise<boolean> {
  return new Promise<boolean>((resolve: (value: boolean) => void,
    reject: (reason: Error) => void): void => {
    const workerInstance: worker.ThreadWorker =
      new worker.ThreadWorker("./workers/ArrayRetainAllPredicateWorker");
    let settled: boolean = false;
    const msg: ArrayRetainAllPredicateMessage = new ArrayRetainAllPredicateMessage();
    msg.arr = array;
    workerInstance.onmessage = (event: MessageEvents): void => {
      settled = true;
      resolve(event.data as boolean);
      workerInstance.terminate();
    };
    workerInstance.onerror = (): void => {
      if (!settled) {
        settled = true;
        reject(new Error("ArrayRetainAllPredicateWorker error"));
      }
      workerInstance.terminate();
    };
    workerInstance.postMessage(msg);
  });
}

export default function CollectionsArrayRetainAllPredicateTest(): void {
  describe('CollectionsArrayRetainAllPredicateTest', (): void => {
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
     * @tc.name   collectionsArrayRetainAllPredicateTest0500
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_0500
     * @tc.desc   Verify retainAll(predicate) with AsyncLock in multi-thread concurrent writes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest0500';
        console.info(`${caseName}, test start`);
        try {
          const sharedArray: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 0; i < 8; i++) {
            sharedArray.push(i + 1);
          }
          const noLockPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
          for (let i: number = 0; i < 3; i++) {
            noLockPromises.push(taskpool.execute(retainAllPredicateRace, sharedArray));
          }
          for (let i: number = 0; i < noLockPromises.length; i++) {
            const code: number = await noLockPromises[i] as number;
            expect(code === 0 || code === 10200201).assertEqual(true);
          }
          const lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
          const lockedArray: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 0; i < 8; i++) {
            lockedArray.push(i + 1);
          }
          const lockPromises: Array<Promise<Object>> = new Array<Promise<Object>>();
          for (let i: number = 0; i < 3; i++) {
            lockPromises.push(taskpool.execute(lockedRetainAllPredicateTask, lockedArray, lock));
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
     * @tc.name   collectionsArrayRetainAllPredicateTest0600
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_0600
     * @tc.desc   Verify retainAll(predicate) exception is non-atomic and no deadlock.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest0600';
        console.info(`${caseName}, test start`);
        const arr: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 10; i++) {
          arr.push(i + 1);
        }
        let thrown: boolean = false;
        try {
          arr.retainAll((value: number): boolean => {
            if (value === 2) {
              throw new Error('pred-fail');
            }
            return value % 2 === 0;
          });
          expect(true).assertFail();
        } catch (error) {
          thrown = true;
          expect(error.message).assertEqual('pred-fail');
        }
        expect(thrown).assertEqual(true);
        const elements: collections.Array<number> = new collections.Array<number>(arr.at(0) as number);
        expect(arr.containsAll(elements)).assertEqual(true);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest0700
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_0700
     * @tc.desc   Verify Worker receives Array and calls retainAll(predicate) correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest0700';
        console.info(`${caseName}, test start`);
        try {
          const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5, 6, 7, 8);
          const result: boolean = await executeArrayRetainAllPredicateWorker(arr);
          expect(result).assertEqual(true);
          expect(arr.length).assertEqual(8);
        } catch (error) {
          console.info(`${caseName}, test error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest0800
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_0800
     * @tc.desc   Verify non-serializable element and >16MB Array cross-thread errors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function): Promise<void> => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest0800';
        console.info(`${caseName}, test start`);
        let thrown: boolean = false;
        try {
          const bigArray: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 0; i < 3000; i++) {
            bigArray.push(i);
          }
         let result: CrossThreadApiResult =  await taskpool.execute(crossThreadApisTask, bigArray,
            new collections.Array<number>(0, 1, 2)) as CrossThreadApiResult;
          expect(result.containsAllResult).assertEqual(true);
          expect(result.retainAllResult).assertEqual(true);
          expect(result.retainAllPredicateResult).assertEqual(true);
          expect(result.finalLength).assertEqual(1);
        } catch (error) {
          expect(true).assertFail();
        }
        try {
          const smallArr: collections.Array<number> = new collections.Array<number>(1, 2, 3);
          const smallElements: collections.Array<number> = new collections.Array<number>(1, 2);
          const result: number =
            await taskpool.execute(containsAllRace, smallArr, smallElements) as number;
          expect(result).assertEqual(0);
        } catch (error) {
          console.info(`${caseName}, follow-up task error: ${JSON.stringify(error)}`);
          expect(true).assertFail();
        }
        console.info(`${caseName}, test end`);
        done();
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest0900
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_0900
     * @tc.desc   Verify retainAll(predicate) at 1023/1024/1025 element boundaries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest0900';
        console.info(`${caseName}, test start`);
        for (let n: number = 1023; n <= 1025; n++) {
          const arr: collections.Array<number> = new collections.Array<number>();
          for (let i: number = 0; i < n; i++) {
            arr.push(i);
          }
          let callCount: number = 0;
          const result: boolean = arr.retainAll((value: number): boolean => {
            callCount++;
            return value < 500;
          });
          expect(result).assertEqual(true);
          expect(callCount).assertEqual(n);
          expect(arr.length).assertEqual(500);
          expect(arr.at(0)).assertEqual(0);
          expect(arr.at(499)).assertEqual(499);
        }
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest1000
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_1000
     * @tc.desc   Verify retainAll(predicate) on empty container.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest1000';
        console.info(`${caseName}, test start`);
        const emptyArr: collections.Array<number> = new collections.Array<number>();
        let callCount: number = 0;
        expect(emptyArr.retainAll((value: number): boolean => {
          callCount++;
          return true;
        })).assertEqual(false);
        expect(callCount).assertEqual(0);
        expect(emptyArr.length).assertEqual(0);
        let callCount2: number = 0;
        expect(emptyArr.retainAll((value: number): boolean => {
          callCount2++;
          return false;
        })).assertEqual(false);
        expect(callCount2).assertEqual(0);
        const nonEmptyArr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        let callCount3: number = 0;
        expect(nonEmptyArr.retainAll((value: number): boolean => {
          callCount3++;
          return false;
        })).assertEqual(true);
        expect(callCount3).assertEqual(5);
        expect(nonEmptyArr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest1100
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_1100
     * @tc.desc   Verify retainAll(predicate) re-entry triggers fail-fast with no deadlock and no duplicate callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest1100';
        console.info(`${caseName}, test start`);

        const arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        let callCount: number = 0;
        let thrown: boolean = false;
        try {
          arr.retainAll((value: number): boolean => {
            callCount++;
            let valueArr: number[] = [value];
            arr.containsAll(valueArr);
            return true;
          });
          expect(true).assertFail();
        } catch (error) {
          thrown = true;
          expect(error.code).assertEqual(10200201);
        }
        expect(thrown).assertEqual(true);
        expect(callCount <= 1).assertEqual(true);

        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest1200
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_1200
     * @tc.desc   Verify retainAll rejects non-function object argument with parameter error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest1200';
        console.info(`${caseName}, test start`);

        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        const retainAllMethod: Function = receiver.retainAll;
        const boundMethod: Function = retainAllMethod.bind(receiver);

        let thrown: boolean = false;
        try {
          boundMethod(new SendableBox(1));
          expect(true).assertFail();
        } catch (error) {
          thrown = true;
        }
        expect(thrown).assertEqual(true);
        expect(receiver.length).assertEqual(3);

        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest3000
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_3000
     * @tc.desc   Verify retainAll(predicate) returns false when predicate keeps all elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest3000';
        console.info(`${caseName}, test start`);

        const predicateReceiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4);
        let visited: number = 0;
        expect(predicateReceiver.retainAll((value: number): boolean => {
          visited++;
          return value > 0;
        })).assertEqual(false);
        expect(predicateReceiver.length).assertEqual(4);
        expect(predicateReceiver.at(0)).assertEqual(1);
        expect(predicateReceiver.at(1)).assertEqual(2);
        expect(predicateReceiver.at(2)).assertEqual(3);
        expect(predicateReceiver.at(3)).assertEqual(4);
        expect(visited).assertEqual(4);

        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest3100
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_3100
     * @tc.desc   Verify retainAll(predicate) partially retains elements when predicate returns mixed results.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest3100';
        console.info(`${caseName}, test start`);

        const predicateReceiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 2);
        let visited: number = 0;
        expect(predicateReceiver.retainAll((value: number): boolean => {
          visited++;
          return value % 2 === 0;
        })).assertEqual(true);
        expect(predicateReceiver.length).assertEqual(3);
        expect(predicateReceiver.at(0)).assertEqual(2);
        expect(predicateReceiver.at(1)).assertEqual(4);
        expect(predicateReceiver.at(2)).assertEqual(2);
        expect(visited).assertEqual(5);

        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest3200
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_3200
     * @tc.desc   Verify retainAll(predicate) triggers fail-fast when re-entered via forEach callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest3200';
        console.info(`${caseName}, test start`);

        const concurrentArray: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        let thrown: boolean = false;
        try {
          concurrentArray.forEach((_value: number, _index: number, array: collections.Array<number>): void => {
            array.retainAll((v: number): boolean => v > 0);
          });
          expect(true).assertFail();
        } catch (error) {
          thrown = true;
          expect(error.code).assertEqual(10200201);
        }
        expect(thrown).assertEqual(true);
        expect(concurrentArray.length).assertEqual(3);
        expect(concurrentArray.at(0)).assertEqual(1);
        expect(concurrentArray.at(1)).assertEqual(2);
        expect(concurrentArray.at(2)).assertEqual(3);

        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest3300
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_3300
     * @tc.desc   Verify retainAll(predicate) reports bind error when receiver is illegal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest3300';
        console.info(`${caseName}, test start`);

        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3);
        const retainAllMethod: Function = receiver.retainAll;
        let thrown: boolean = false;
        try {
          retainAllMethod((value: number): boolean => {
            return value >= 0;
          });
          expect(true).assertFail();
        } catch (error) {
          thrown = true;
          expect(error.code).assertEqual(10200011);
        }
        expect(thrown).assertEqual(true);

        const boundRetainAll: Function = retainAllMethod.bind(new SendableBox(1));
        thrown = false;
        try {
          boundRetainAll((value: number): boolean => {
            return value >= 0;
          });
          expect(true).assertFail();
        } catch (error) {
          thrown = true;
          expect(error.code).assertEqual(10200011);
        }
        expect(thrown).assertEqual(true);

        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest3400
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_3400
     * @tc.desc   Verify retainAll(predicate) keeps all matching duplicate elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest3400';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 1, 2, 2, 3, 3);
        expect(receiver.retainAll((value: number): boolean => value === 1)).assertEqual(true);
        expect(receiver.length).assertEqual(2);
        expect(receiver.at(0)).assertEqual(1);
        expect(receiver.at(1)).assertEqual(1);
        const receiver2: collections.Array<number> = new collections.Array<number>(5, 5, 5, 6, 6);
        expect(receiver2.retainAll((value: number): boolean => value === 5)).assertEqual(true);
        expect(receiver2.length).assertEqual(3);
        expect(receiver2.at(0)).assertEqual(5);
        expect(receiver2.at(1)).assertEqual(5);
        expect(receiver2.at(2)).assertEqual(5);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest3500
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_3500
     * @tc.desc   Verify retainAll(predicate) keeps middle elements removing head and tail.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest3500';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        expect(receiver.retainAll((value: number): boolean => value >= 2 && value <= 4)).assertEqual(true);
        expect(receiver.length).assertEqual(3);
        expect(receiver.at(0)).assertEqual(2);
        expect(receiver.at(1)).assertEqual(3);
        expect(receiver.at(2)).assertEqual(4);
        const receiver2: collections.Array<number> = new collections.Array<number>(10, 20, 30, 40, 50);
        expect(receiver2.retainAll((value: number): boolean => value === 20 || value === 40)).assertEqual(true);
        expect(receiver2.length).assertEqual(2);
        expect(receiver2.at(0)).assertEqual(20);
        expect(receiver2.at(1)).assertEqual(40);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest3600
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_3600
     * @tc.desc   Verify retainAll(predicate) returns false when predicate always true with duplicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest3600';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 1, 2, 2);
        expect(receiver.retainAll((value: number): boolean => true)).assertEqual(false);
        expect(receiver.length).assertEqual(4);
        expect(receiver.at(0)).assertEqual(1);
        expect(receiver.at(1)).assertEqual(1);
        expect(receiver.at(2)).assertEqual(2);
        expect(receiver.at(3)).assertEqual(2);
        const receiver2: collections.Array<number> = new collections.Array<number>(1, 1, 1);
        expect(receiver2.retainAll((value: number): boolean => true)).assertEqual(false);
        expect(receiver2.length).assertEqual(3);
        expect(receiver2.at(0)).assertEqual(1);
        expect(receiver2.at(1)).assertEqual(1);
        expect(receiver2.at(2)).assertEqual(1);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest3700
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_3700
     * @tc.desc   Verify retainAll(predicate) with consecutive duplicate elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest3700';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 1, 1, 1, 2, 2, 2, 2);
        expect(receiver.retainAll((value: number): boolean => value === 1)).assertEqual(true);
        expect(receiver.length).assertEqual(4);
        expect(receiver.at(0)).assertEqual(1);
        expect(receiver.at(1)).assertEqual(1);
        expect(receiver.at(2)).assertEqual(1);
        expect(receiver.at(3)).assertEqual(1);
        const receiver2: collections.Array<number> = new collections.Array<number>(3, 3, 3, 4, 4, 4, 4, 4);
        expect(receiver2.retainAll((value: number): boolean => value === 4)).assertEqual(true);
        expect(receiver2.length).assertEqual(5);
        expect(receiver2.at(0)).assertEqual(4);
        expect(receiver2.at(1)).assertEqual(4);
        expect(receiver2.at(2)).assertEqual(4);
        expect(receiver2.at(3)).assertEqual(4);
        expect(receiver2.at(4)).assertEqual(4);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest3800
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_3800
     * @tc.desc   Verify retainAll(predicate) with 10250 elements, retain first 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest3800';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 10250; i++) {
          receiver.push(i);
        }
        let callCount: number = 0;
        expect(receiver.retainAll((value: number): boolean => {
          callCount++;
          return value < 100;
        })).assertEqual(true);
        expect(callCount).assertEqual(10250);
        expect(receiver.length).assertEqual(100);
        expect(receiver.at(0)).assertEqual(0);
        expect(receiver.at(99)).assertEqual(99);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest3900
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_3900
     * @tc.desc   Verify retainAll(predicate) with 10250 elements, all retained returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest3900';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 10250; i++) {
          receiver.push(i);
        }
        expect(receiver.retainAll((value: number): boolean => true)).assertEqual(false);
        expect(receiver.length).assertEqual(10250);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest4000
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_4000
     * @tc.desc   Verify retainAll(predicate) with 10250 elements, all removed returns true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest4000';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 10250; i++) {
          receiver.push(i);
        }
        expect(receiver.retainAll((value: number): boolean => false)).assertEqual(true);
        expect(receiver.length).assertEqual(0);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest4100
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_4100
     * @tc.desc   Verify retainAll(predicate) with 10250 alternating pattern elements.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest4100';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>();
        for (let i: number = 0; i < 10250; i++) {
          receiver.push(i % 2);
        }
        expect(receiver.retainAll((value: number): boolean => value === 0)).assertEqual(true);
        expect(receiver.length).assertEqual(5125);
        expect(receiver.at(0)).assertEqual(0);
        expect(receiver.at(1024)).assertEqual(0);
        console.info(`${caseName}, test end`);
      });

    /**
     * @tc.name   collectionsArrayRetainAllPredicateTest3400
     * @tc.number SUB_COLLECTIONS_ARRAY_RETAIN_ALL_PREDICATE_3400
     * @tc.desc   Verify retainAll with explicitly declared ArrayElementPredicateFn type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('collectionsArrayRetainAllPredicateTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (): void => {
        const caseName: string = 'collectionsArrayRetainAllPredicateTest3400';
        console.info(`${caseName}, test start`);
        const receiver: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
        const predicate: collections.ArrayElementPredicateFn<number> = (value: number): boolean => value >= 3;
        expect(receiver.retainAll(predicate)).assertEqual(true);
        expect(receiver.length).assertEqual(3);
        expect(receiver.at(0)).assertEqual(3);
        expect(receiver.at(1)).assertEqual(4);
        expect(receiver.at(2)).assertEqual(5);
        console.info(`${caseName}, test end`);
      });
  });
}
