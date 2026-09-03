/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, taskpool } from '@kit.ArkTS';

const SLEEP_INTERVAL_MS: number = 100;

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, ms));
}

@Concurrent
function concurrentReadLength(bv: collections.BitVector): number {
  return bv.length;
}

@Concurrent
function concurrentReadIndex(bv: collections.BitVector, index: number): number {
  return bv[index];
}

@Concurrent
function concurrentHas(bv: collections.BitVector, element: number, fromIndex: number, toIndex: number): boolean {
  return bv.has(element, fromIndex, toIndex);
}

@Concurrent
function concurrentGetBitCountByRange(bv: collections.BitVector, element: number, fromIndex: number,
  toIndex: number): number {
  return bv.getBitCountByRange(element, fromIndex, toIndex);
}

@Concurrent
function concurrentGetIndexOf(bv: collections.BitVector, element: number, fromIndex: number, toIndex: number): number {
  return bv.getIndexOf(element, fromIndex, toIndex);
}

@Concurrent
function concurrentPush(bv: collections.BitVector, element: number): number {
  bv.push(element);
  return bv.length;
}

@Concurrent
function concurrentSetAllBits(bv: collections.BitVector, element: number): number {
  bv.setAllBits(element);
  return bv.length;
}

@Concurrent
function concurrentSetBitsByRange(bv: collections.BitVector, element: number, fromIndex: number,
  toIndex: number): number {
  bv.setBitsByRange(element, fromIndex, toIndex);
  return bv.length;
}

@Concurrent
function concurrentFlipBitsByRange(bv: collections.BitVector, fromIndex: number, toIndex: number): number {
  bv.flipBitsByRange(fromIndex, toIndex);
  return bv.length;
}

@Concurrent
function concurrentResize(bv: collections.BitVector, size: number): number {
  bv.resize(size);
  return bv.length;
}

@Concurrent
function concurrentValuesSum(bv: collections.BitVector): number {
  let sum: number = 0;
  let iter = bv.values();
  let temp = iter.next();
  while (!temp.done) {
    sum += temp.value;
    temp = iter.next();
  }
  return sum;
}

@Concurrent
function concurrentAllOpsTryCatch(bv: collections.BitVector, iterations: number): number {
  let errorCount: number = 0;
  for (let i = 0; i < iterations; i++) {
    let element: number = i % 2;
    try {
      bv.push(element);
    } catch (err) {
      errorCount++;
    }
    try {
      if (bv.length > 0) {
        bv.has(element, 0, bv.length);
      }
    } catch (err) {
      errorCount++;
    }
    try {
      if (bv.length > 0) {
        bv.getBitCountByRange(element, 0, bv.length);
      }
    } catch (err) {
      errorCount++;
    }
    try {
      if (bv.length > 0) {
        bv.getIndexOf(element, 0, bv.length);
      }
    } catch (err) {
      errorCount++;
    }
    try {
      if (bv.length > 0) {
        bv.getLastIndexOf(element, 0, bv.length);
      }
    } catch (err) {
      errorCount++;
    }
    try {
      if (bv.length > 1) {
        bv.setBitsByRange(element, 0, 1);
      }
    } catch (err) {
      errorCount++;
    }
    try {
      bv.setAllBits(element);
    } catch (err) {
      errorCount++;
    }
    try {
      if (bv.length > 0) {
        bv.flipBitByIndex(0);
      }
    } catch (err) {
      errorCount++;
    }
    try {
      if (bv.length > 1) {
        bv.flipBitsByRange(0, 1);
      }
    } catch (err) {
      errorCount++;
    }
    try {
      if (bv.length > 0) {
        bv.pop();
      }
    } catch (err) {
      errorCount++;
    }
    try {
      if (bv.length > 0) {
        let v: number = bv[0];
      }
    } catch (err) {
      errorCount++;
    }
  }
  return errorCount;
}

@Concurrent
async function concurrentAllOpsWithLock(bv: collections.BitVector, lock: ArkTSUtils.locks.AsyncLock,
  iterations: number): Promise<number> {
  return await lock.lockAsync<number>(() => {
    let errorCount: number = 0;
    for (let i = 0; i < iterations; i++) {
      let element: number = i % 2;
      bv.push(element);
      if (bv.length > 0) {
        bv.has(element, 0, bv.length);
      }
      if (bv.length > 0) {
        bv.getBitCountByRange(element, 0, bv.length);
      }
      if (bv.length > 0) {
        bv.getIndexOf(element, 0, bv.length);
      }
      if (bv.length > 0) {
        bv.getLastIndexOf(element, 0, bv.length);
      }
      if (bv.length > 1) {
        bv.setBitsByRange(element, 0, 1);
      }
      bv.setAllBits(element);
      if (bv.length > 0) {
        bv.flipBitByIndex(0);
      }
      if (bv.length > 1) {
        bv.flipBitsByRange(0, 1);
      }
      if (bv.length > 0) {
        bv.pop();
      }
      if (bv.length > 0) {
        let v: number = bv[0];
      }
    }
    return errorCount;
  });
}

@Concurrent
function createBitVectorInWorker(length: number): collections.BitVector {
  let bv: collections.BitVector = new collections.BitVector(length);
  return bv;
}

@Concurrent
function createAndPopulateBitVector(count: number): collections.BitVector {
  let bv: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < count; i++) {
    bv.push(i % 2);
  }
  return bv;
}

@Concurrent
function concurrentGetBitsByRangeResult(bv: collections.BitVector, fromIndex: number,
  toIndex: number): collections.BitVector {
  return bv.getBitsByRange(fromIndex, toIndex);
}

@Concurrent
function concurrentHasToIndexLength(bv: collections.BitVector, element: number): boolean {
  return bv.has(element, 0, bv.length);
}

@Concurrent
function concurrentSingleElementOps(): number {
  let bv: collections.BitVector = new collections.BitVector(0);
  bv.push(1);
  let len: number = bv.length;
  let val: number = bv[0];
  let hasResult: boolean = bv.has(1, 0, 1);
  bv.flipBitByIndex(0);
  let flipped: number = bv[0];
  bv.setAllBits(0);
  let allZero: number = bv[0];
  return len * 100000 + val * 10000 + (hasResult ? 1000 : 0) + flipped * 100 + allZero * 10;
}

@Concurrent
function concurrentEmptyPushOps(): number {
  let bv: collections.BitVector = new collections.BitVector(0);
  let beforeLen: number = bv.length;
  bv.push(1);
  let afterLen: number = bv.length;
  let val: number = bv[0];
  let hasResult: boolean = bv.has(1, 0, 1);
  return beforeLen * 10000 + afterLen * 1000 + val * 100 + (hasResult ? 10 : 0);
}

@Concurrent
function concurrentSendDataLength(bv: collections.BitVector): number {
  taskpool.Task.sendData(bv.length);
  bv.push(1);
  return bv.length;
}

@Concurrent
function concurrentOutOfRangeIndex(bv: collections.BitVector, index: number): number {
  return bv[index];
}

@Concurrent
function concurrentMultiBitVectorOps(): number {
  let bv1: collections.BitVector = new collections.BitVector(0);
  bv1.push(1);
  bv1.push(0);
  let bv2: collections.BitVector = new collections.BitVector(0);
  bv2.push(0);
  bv2.push(1);
  bv1.setBitsByRange(1, 0, 2);
  let count1: number = bv1.getBitCountByRange(1, 0, 2);
  let count2: number = bv2.getBitCountByRange(1, 0, 2);
  return count1 * 10 + count2;
}

@Concurrent
function concurrentLargeBoundaryOps(count: number): number {
  let bv: collections.BitVector = new collections.BitVector(0);
  for (let i = 0; i < count; i++) {
    bv.push(i % 2);
  }
  let hasResult: boolean = bv.has(1, 0, count);
  let countResult: number = bv.getBitCountByRange(1, 0, count);
  let indexResult: number = bv.getIndexOf(1, 0, count);
  bv.flipBitsByRange(0, count);
  let afterFlip: number = bv.getBitCountByRange(1, 0, count);
  return (hasResult ? 100000 : 0) + countResult * 1000 + indexResult * 100 + afterFlip * 10;
}

export default function BitVectorUnboundTest() {
  describe('BitVectorUnboundTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      // Add delay to ensure resources from the previous test case are released
      await sleep(SLEEP_INTERVAL_MS);
    })
        /**
         * @tc.name   testBitVectorGetLastIndexOf0019
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1301
         * @tc.desc   BitVector getLastIndexOf method binding error code 10200011 test.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorGetLastIndexOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            const TAG = "testBitVectorGetLastIndexOf0019";
            let bitVectorList: collections.BitVector | null = null;
            try {
              bitVectorList = new collections.BitVector(5);
              for (let i = 0; i < 5; i++) {
                if (i < 5) {
                  bitVectorList.push(i % 2);
                }
              }
              let getLastIndexOfFn = bitVectorList.getLastIndexOf;
              bitVectorList = null;
              getLastIndexOfFn(0, 0, 5);
              expect().assertFail();
            } catch (err) {
              console.error(`${TAG} failed, error: ${err.message}`);
              expect(err.code).assertEqual(10200011);
            }
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentReadLength
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1302
         * @tc.desc   BitVector cross-thread: TaskPool reads length.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentReadLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 10; i++) {
              bv.push(i % 2);
            }
            let task: taskpool.Task = new taskpool.Task(concurrentReadLength, bv);
            let result: number = await taskpool.execute(task) as number;
            expect(result).assertEqual(10);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentReadIndex
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1303
         * @tc.desc   BitVector cross-thread: TaskPool reads [index].
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentReadIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            bv.push(0);
            bv.push(1);
            bv.push(0);
            let task: taskpool.Task = new taskpool.Task(concurrentReadIndex, bv, 1);
            let result: number = await taskpool.execute(task) as number;
            expect(result).assertEqual(1);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentHas
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1304
         * @tc.desc   BitVector cross-thread: TaskPool calls has().
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentHas', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 10; i++) {
              bv.push(i % 2);
            }
            let task: taskpool.Task = new taskpool.Task(concurrentHas, bv, 1, 0, 10);
            let result: boolean = await taskpool.execute(task) as boolean;
            expect(result).assertEqual(true);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentGetBitCountByRange
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1305
         * @tc.desc   BitVector cross-thread: TaskPool calls getBitCountByRange().
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentGetBitCountByRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 10; i++) {
              bv.push(i % 2);
            }
            let task: taskpool.Task = new taskpool.Task(concurrentGetBitCountByRange, bv, 1, 0, 10);
            let result: number = await taskpool.execute(task) as number;
            expect(result).assertEqual(5);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentGetIndexOf
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1306
         * @tc.desc   BitVector cross-thread: TaskPool calls getIndexOf().
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentGetIndexOf', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 10; i++) {
              bv.push(i % 2);
            }
            let task: taskpool.Task = new taskpool.Task(concurrentGetIndexOf, bv, 1, 0, 10);
            let result: number = await taskpool.execute(task) as number;
            expect(result).assertEqual(1);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentValuesSum
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1307
         * @tc.desc   BitVector cross-thread: TaskPool iterates values() and sums.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentValuesSum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 10; i++) {
              bv.push(i % 2);
            }
            let task: taskpool.Task = new taskpool.Task(concurrentValuesSum, bv);
            let result: number = await taskpool.execute(task) as number;
            expect(result).assertEqual(5);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentPush
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1308
         * @tc.desc   BitVector cross-thread: TaskPool push() then main thread verifies.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentPush', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            bv.push(0);
            bv.push(0);
            let task: taskpool.Task = new taskpool.Task(concurrentPush, bv, 1);
            let result: number = await taskpool.execute(task) as number;
            expect(result).assertEqual(3);
            expect(bv.length).assertEqual(3);
            expect(bv[2]).assertEqual(1);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentSetAllBits
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1309
         * @tc.desc   BitVector cross-thread: TaskPool setAllBits() then main thread verifies.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentSetAllBits', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 5; i++) {
              bv.push(0);
            }
            let task: taskpool.Task = new taskpool.Task(concurrentSetAllBits, bv, 1);
            let result: number = await taskpool.execute(task) as number;
            expect(result).assertEqual(5);
            for (let i = 0; i < 5; i++) {
              expect(bv[i]).assertEqual(1);
            }
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentSetBitsByRange
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1310
         * @tc.desc   BitVector cross-thread: TaskPool setBitsByRange() then main thread verifies.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentSetBitsByRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 10; i++) {
              bv.push(0);
            }
            let task: taskpool.Task = new taskpool.Task(concurrentSetBitsByRange, bv, 1, 0, 5);
            let result: number = await taskpool.execute(task) as number;
            expect(result).assertEqual(10);
            for (let i = 0; i < 5; i++) {
              expect(bv[i]).assertEqual(1);
            }
            for (let i = 5; i < 10; i++) {
              expect(bv[i]).assertEqual(0);
            }
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentFlipBitsByRange
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1311
         * @tc.desc   BitVector cross-thread: TaskPool flipBitsByRange() then main thread verifies.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentFlipBitsByRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 10; i++) {
              bv.push(i % 2);
            }
            let task: taskpool.Task = new taskpool.Task(concurrentFlipBitsByRange, bv, 0, 10);
            let result: number = await taskpool.execute(task) as number;
            expect(result).assertEqual(10);
            for (let i = 0; i < 10; i++) {
              expect(bv[i]).assertEqual((i + 1) % 2);
            }
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentResize
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1312
         * @tc.desc   BitVector cross-thread: TaskPool resize() then main thread verifies.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentResize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            bv.push(1);
            bv.push(0);
            bv.push(1);
            let task: taskpool.Task = new taskpool.Task(concurrentResize, bv, 5);
            let result: number = await taskpool.execute(task) as number;
            expect(result).assertEqual(5);
            expect(bv.length).assertEqual(5);
            expect(bv[0]).assertEqual(1);
            expect(bv[3]).assertEqual(0);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentMultiRead
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1313
         * @tc.desc   BitVector concurrent: multiple TaskPool tasks read same BitVector.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentMultiRead', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 20; i++) {
              bv.push(i % 2);
            }
            let task1: taskpool.Task = new taskpool.Task(concurrentReadLength, bv);
            let task2: taskpool.Task = new taskpool.Task(concurrentGetBitCountByRange, bv, 1, 0, 20);
            let task3: taskpool.Task = new taskpool.Task(concurrentHas, bv, 1, 0, 20);
            let group = new taskpool.TaskGroup();
            group.addTask(task1);
            group.addTask(task2);
            group.addTask(task3);
            let results: Object[] = await taskpool.execute(group) as Object[];
            expect(results[0]).assertEqual(20);
            expect(results[1]).assertEqual(10);
            expect(results[2]).assertEqual(true);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentMultiReadIndex
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1314
         * @tc.desc   BitVector concurrent: multiple TaskPool tasks read different indices.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentMultiReadIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            bv.push(1);
            bv.push(0);
            bv.push(1);
            bv.push(0);
            bv.push(1);
            let task0: taskpool.Task = new taskpool.Task(concurrentReadIndex, bv, 0);
            let task1: taskpool.Task = new taskpool.Task(concurrentReadIndex, bv, 1);
            let task2: taskpool.Task = new taskpool.Task(concurrentReadIndex, bv, 4);
            let p0: Promise<number> = taskpool.execute(task0) as Promise<number>;
            let p1: Promise<number> = taskpool.execute(task1) as Promise<number>;
            let p2: Promise<number> = taskpool.execute(task2) as Promise<number>;
            let results: number[] = await Promise.all([p0, p1, p2]) as number[];
            expect(results[0]).assertEqual(1);
            expect(results[1]).assertEqual(0);
            expect(results[2]).assertEqual(1);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentAllOpsTryCatch
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1315
         * @tc.desc   BitVector concurrent: 10 loops, main thread + TaskPool simultaneously call all interfaces, try-catch, only assert task completed.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentAllOpsTryCatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 10; i++) {
              bv.push(i % 2);
            }
    
            let count: number = 0;
            for (let i = 0; i < 10; i++) {
              let task: taskpool.Task = new taskpool.Task(concurrentAllOpsTryCatch, bv, 10);
              await taskpool.execute(task).then((result: Object) => {
                count++;
              });
              concurrentAllOpsTryCatch(bv, 10)
            }
            let waitCount: number = 0;
            while (count < 10 && waitCount < 100) {
              await sleep(100);
              waitCount++;
            }
            expect(count).assertEqual(10);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentWithLock
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1316
         * @tc.desc   BitVector with AsyncLock: 10 loops, TaskPool + main thread both acquire lock, serialized, assert data.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentWithLock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 10; i++) {
              bv.push(i % 2);
            }
            let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('bitVectorLock');
            let count: number = 0;
            for (let i = 0; i < 10; i++) {
              let task: taskpool.Task = new taskpool.Task(concurrentAllOpsWithLock, bv, lock, 10);
              await taskpool.execute(task).then((result: Object) => {
                count++;
              });
              concurrentAllOpsWithLock(bv, lock, 10);
            }
            let waitCount: number = 0;
            while (count < 10 && waitCount < 100) {
              await sleep(100);
              waitCount++;
            }
            expect(count).assertEqual(10);
            expect(bv.length).assertEqual(10);
            done()
          });

        /**
         * @tc.name   testBitVectorMethodBindingPush
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1317
         * @tc.desc   BitVector method binding: push detached call, expect 10200011.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorMethodBindingPush', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            bv.push(0);
            let pushFn = bv.push;
            try {
              pushFn(1);
              expect().assertFail();
            } catch (err) {
              expect(err.code).assertEqual(10200011);
            }
            done()
          });

        /**
         * @tc.name   testBitVectorMethodBindingHas
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1318
         * @tc.desc   BitVector method binding: has detached call, expect 10200011.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorMethodBindingHas', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            bv.push(0);
            bv.push(1);
            let hasFn = bv.has;
            try {
              hasFn(1, 0, 2);
              expect().assertFail();
            } catch (err) {
              expect(err.code).assertEqual(10200011);
            }
            done()
          });

        /**
         * @tc.name   testBitVectorMethodBindingPop
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1319
         * @tc.desc   BitVector method binding: pop detached call, expect 10200011.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorMethodBindingPop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            bv.push(1);
            let popFn = bv.pop;
            try {
              popFn();
              expect().assertFail();
            } catch (err) {
              expect(err.code).assertEqual(10200011);
            }
            done()
          });

        /**
         * @tc.name   testBitVectorCrossThreadVisibility
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1320
         * @tc.desc   BitVector cross-thread: TaskPool modifies, main thread immediately sees changes.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorCrossThreadVisibility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 5; i++) {
              bv.push(0);
            }
            let task: taskpool.Task = new taskpool.Task(concurrentSetAllBits, bv, 1);
            await taskpool.execute(task);
            expect(bv.length).assertEqual(5);
            for (let i = 0; i < 5; i++) {
              expect(bv[i]).assertEqual(1);
            }
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentCreateInWorker
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1321
         * @tc.desc   BitVector created in worker thread, returned to main thread, verify length and values.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentCreateInWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let task: taskpool.Task = new taskpool.Task(createBitVectorInWorker, 5);
            let bv: collections.BitVector = await taskpool.execute(task) as collections.BitVector;
            expect(bv.length).assertEqual(5);
            for (let i = 0; i < 5; i++) {
              expect(bv[i]).assertEqual(0);
            }
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentCreateAndPopulate
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1322
         * @tc.desc   BitVector created and populated in worker, returned to main thread, verify values.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentCreateAndPopulate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let task: taskpool.Task = new taskpool.Task(createAndPopulateBitVector, 10);
            let bv: collections.BitVector = await taskpool.execute(task) as collections.BitVector;
            expect(bv.length).assertEqual(10);
            for (let i = 0; i < 10; i++) {
              expect(bv[i]).assertEqual(i % 2);
            }
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentReturnGetBitsByRange
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1323
         * @tc.desc   BitVector getBitsByRange in worker returns BitVector, main thread verifies.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentReturnGetBitsByRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 10; i++) {
              bv.push(i % 2);
            }
            let task: taskpool.Task = new taskpool.Task(concurrentGetBitsByRangeResult, bv, 2, 7);
            let result: collections.BitVector = await taskpool.execute(task) as collections.BitVector;
            expect(result.length).assertEqual(5);
            expect(result[0]).assertEqual(0);
            expect(result[1]).assertEqual(1);
            expect(result[2]).assertEqual(0);
            expect(result[3]).assertEqual(1);
            expect(result[4]).assertEqual(0);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentWorkerCreatedMainOperates
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1324
         * @tc.desc   BitVector created in worker, main thread operates on it (push/has/setBitsByRange).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentWorkerCreatedMainOperates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let task: taskpool.Task = new taskpool.Task(createAndPopulateBitVector, 5);
            let bv: collections.BitVector = await taskpool.execute(task) as collections.BitVector;
            expect(bv.length).assertEqual(5);
            bv.push(1);
            expect(bv.length).assertEqual(6);
            expect(bv[5]).assertEqual(1);
            bv.setAllBits(0);
            for (let i = 0; i < 6; i++) {
              expect(bv[i]).assertEqual(0);
            }
            bv.setBitsByRange(1, 0, 3);
            expect(bv.getBitCountByRange(1, 0, 6)).assertEqual(3);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentBoundaryHasToIndexLength
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1325
         * @tc.desc   BitVector boundary in worker: has(element, 0, length) with toIndex=length.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentBoundaryHasToIndexLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 10; i++) {
              bv.push(i % 2);
            }
            let task: taskpool.Task = new taskpool.Task(concurrentHasToIndexLength, bv, 1);
            let result: boolean = await taskpool.execute(task) as boolean;
            expect(result).assertEqual(true);
            let task2: taskpool.Task = new taskpool.Task(concurrentHasToIndexLength, bv, 0);
            let result2: boolean = await taskpool.execute(task2) as boolean;
            expect(result2).assertEqual(true);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentBoundarySingleElement
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1326
         * @tc.desc   BitVector boundary in worker: single element all operations.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentBoundarySingleElement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let task: taskpool.Task = new taskpool.Task(concurrentSingleElementOps);
            let result: number = await taskpool.execute(task) as number;
            expect(result).assertEqual(111000);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentBoundaryEmptyPush
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1327
         * @tc.desc   BitVector boundary in worker: push on empty BitVector.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentBoundaryEmptyPush', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let task: taskpool.Task = new taskpool.Task(concurrentEmptyPushOps);
            let result: number = await taskpool.execute(task) as number;
            expect(result).assertEqual(1110);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentBoundaryLargeOps
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1328
         * @tc.desc   BitVector boundary in worker: large BitVector (1000 elements) boundary operations.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentBoundaryLargeOps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let task: taskpool.Task = new taskpool.Task(concurrentLargeBoundaryOps, 1000);
            let result: number = await taskpool.execute(task) as number;
            expect(result).assertEqual(100000 + 500 * 1000 + 1 * 100 + 500 * 10);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentSendData
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1329
         * @tc.desc   BitVector sendData from worker: send length during task execution.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentSendData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            for (let i = 0; i < 10; i++) {
              bv.push(i % 2);
            }
            let task: taskpool.Task = new taskpool.Task(concurrentSendDataLength, bv);
            let receivedLength: number = -1;
            task.onReceiveData((data: Object) => {
              receivedLength = data as number;
            });
            let result: number = await taskpool.execute(task) as number;
            expect(result).assertEqual(11);
            expect(receivedLength).assertEqual(10);
            expect(bv.length).assertEqual(11);
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentErrorOutOfRange
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1330
         * @tc.desc   BitVector error propagation: out of range index in worker throws, main thread catches.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentErrorOutOfRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let bv: collections.BitVector = new collections.BitVector(0);
            bv.push(1);
            bv.push(0);
            let task: taskpool.Task = new taskpool.Task(concurrentOutOfRangeIndex, bv, 5);
            try {
              await taskpool.execute(task);
              expect().assertFail();
            } catch (err) {
              expect(err !== undefined).assertTrue();
            }
            done()
          });

        /**
         * @tc.name   testBitVectorConcurrentMultiBitVector
         * @tc.number SUB_COMMONLIBRARY_BITVECTOR_TEST_1331
         * @tc.desc   BitVector multi: create and operate multiple BitVectors in same worker task.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testBitVectorConcurrentMultiBitVector', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
          async (done: Function) => {
            let task: taskpool.Task = new taskpool.Task(concurrentMultiBitVectorOps);
            let result: number = await taskpool.execute(task) as number;
            expect(result).assertEqual(21);
            done()
          });

  })
}
