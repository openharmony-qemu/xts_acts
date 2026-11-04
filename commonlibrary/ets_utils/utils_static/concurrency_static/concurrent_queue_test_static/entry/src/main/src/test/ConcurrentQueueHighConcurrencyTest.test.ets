'use static';
/*
 * Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-static/src/main/indexStatic';

/**
 * Add items with unique IDs and return count of successful adds.
 */
function addOnlyTask(queue: containers.stackless.ConcurrentQueue<number>, start: number, count: number): number {
  let added: number = 0;
  for (let i: number = start; i < start + count; i++) {
    if (queue.add(i)) {
      added++;
    }
  }
  return added;
}

/**
 * Add and poll items with unique IDs, return count of polled items.
 */
function addPollTask(queue: containers.stackless.ConcurrentQueue<number>, start: number, count: number): number {
  let completed: number = 0;
  for (let i: number = start; i < start + count; i++) {
    if (queue.add(i)) {
      let item: number | undefined = queue.poll();
      if (item !== undefined) {
        completed++;
      }
    }
  }
  return completed;
}

/**
 * Producer: add items with unique IDs, return count of successful adds.
 */
function producerTask(queue: containers.stackless.ConcurrentQueue<number>, start: number, count: number,
  signalReady: boolean): number {
  if (signalReady) {
    taskpool.Task.sendData(1.0);
  }
  let added: number = 0;
  for (let i: number = start; i < start + count; i++) {
    if (queue.add(i)) {
      added++;
    }
  }
  return added;
}

/**
 * Consumer: poll items and return count of polled items.
 */
function consumerTask(queue: containers.stackless.ConcurrentQueue<number>, seen: containers.ConcurrentSet<number>,
  count: number): number {
  let consumed: number = 0;
  while (consumed < count) {
    let item: number | undefined = queue.poll();
    if (item !== undefined) {
      seen.add(item);
      consumed++;
    }
  }
  return consumed;
}

/**
 * Push a value with blocking push; signal ready before blocking.
 */
async function pushBlockTask(queue: containers.stackless.ConcurrentQueue<number>, value: number,
  readySignal: number): Promise<number> {
  if (readySignal > 0) {
    taskpool.Task.sendData(readySignal);
  }
  await queue.push(value);
  return 1;
}

/**
 * Pop a value with blocking pop; signal ready before blocking.
 */
async function popBlockTask(queue: containers.stackless.ConcurrentQueue<number>,
  readySignal: number): Promise<number> {
  if (readySignal > 0) {
    taskpool.Task.sendData(readySignal);
  }
  let value: number = await queue.pop();
  return value;
}

/**
 * Nested TaskPool task: at deepest level add items; otherwise spawn child and await.
 */
async function nestedQueueTask(queue: containers.stackless.ConcurrentQueue<number>, depth: number,
  maxDepth: number, start: number, count: number): Promise<number> {
  if (depth >= maxDepth) {
    let added: number = 0;
    for (let i: number = start; i < start + count; i++) {
      if (queue.add(i)) {
        added++;
      }
    }
    return added;
  }
  let result: Any = await taskpool.execute(nestedQueueTask, queue, depth + 1.0, maxDepth, start, count);
  return result as number;
}

/**
 * Pop count items via blocking pop, record into seen set, return consumed count.
 */
async function popCollectTask(queue: containers.stackless.ConcurrentQueue<number>,
  seen: containers.ConcurrentSet<number>, count: number): Promise<number> {
  let consumed: number = 0;
  while (consumed < count) {
    let item: number = await queue.pop();
    seen.add(item);
    consumed++;
  }
  return consumed;
}

/**
 * Full API participant: push count, add count, pop count (twice).
 * Returns produced count (2*count). Covers push, add, pop.
 */
async function fullApiParticipant(queue: containers.stackless.ConcurrentQueue<number>, start: number,
  count: number, seen: containers.ConcurrentSet<number>): Promise<number> {
  let produced: number = 0;
  for (let i: number = start; i < start + count; i++) {
    await queue.push(i);
    produced++;
  }
  for (let i: number = start + count; i < start + count * 2; i++) {
    if (queue.add(i)) {
      produced++;
    }
  }
  for (let i: number = 0; i < count; i++) {
    let item: number = await queue.pop();
    seen.add(item);
  }
  for (let i: number = 0; i < count; i++) {
    let item: number = await queue.pop();
    seen.add(item);
  }
  return produced;
}

export default function ConcurrentQueueHighConcurrencyTest(): void {
  describe('ConcurrentQueueHighConcurrencyTest', (): void => {
    beforeAll((): void => {});
    beforeEach((): void => {});
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_0100
     * @tc.desc   Verify 1 worker add and poll on LinkedConcurrentQueue with unique IDs 0-9
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(100);
          let result: Any = await taskpool.execute(addPollTask, queue, 0.0, 10.0);
          expect(result as number).assertEqual(10);
          expect(queue.isEmpty()).assertTrue();
          expect(queue.size).assertEqual(0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_0200
     * @tc.desc   Verify 3 workers concurrently add items with unique IDs 0-299 on LinkedConcurrentQueue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(1000);
          let tasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 3; i++) {
            tasks.push(taskpool.execute(addOnlyTask, queue, i * 100.0, 100.0));
          }
          let results: Any = await Promise.all(tasks);
          let resultArr: Any[] = results as Any[];
          expect(resultArr[0] as number).assertEqual(100);
          expect(resultArr[1] as number).assertEqual(100);
          expect(resultArr[2] as number).assertEqual(100);
          expect(queue.size).assertEqual(300);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_0300
     * @tc.desc   Verify 5 workers concurrently add and poll on LinkedConcurrentQueue with unique IDs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(100);
          let tasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 5; i++) {
            tasks.push(taskpool.execute(addPollTask, queue, i * 10.0, 10.0));
          }
          let results: Any = await Promise.all(tasks);
          let resultArr: Any[] = results as Any[];
          for (let i: int = 0; i < 5; i++) {
            expect(resultArr[i] as number).assertEqual(10);
          }
          expect(queue.isEmpty()).assertTrue();
          expect(queue.size).assertEqual(0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_0400
     * @tc.desc   Verify 10 workers concurrently add and poll on LinkedConcurrentQueue with unique IDs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(200);
          let tasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 10; i++) {
            tasks.push(taskpool.execute(addPollTask, queue, i * 10.0, 10.0));
          }
          let results: Any = await Promise.all(tasks);
          let resultArr: Any[] = results as Any[];
          for (let i: int = 0; i < 10; i++) {
            expect(resultArr[i] as number).assertEqual(10);
          }
          expect(queue.isEmpty()).assertTrue();
          expect(queue.size).assertEqual(0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_0500
     * @tc.desc   Verify 50 producers and 50 consumers transfer unique IDs on LinkedConcurrentQueue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(1000);
          let producerTasks: Promise<Any>[] = [];
          let firstReady: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
            let readyTask: taskpool.Task = new taskpool.Task(producerTask, queue, 0.0, 10.0, true);
            readyTask.onReceiveData((signal: number): void => {
              if (signal === 1.0) {
                resolve(undefined);
              }
            });
            producerTasks.push(taskpool.execute(readyTask));
          });
          for (let i: int = 0; i < 50; i++) {
            if (i > 0) {
              producerTasks.push(taskpool.execute(producerTask, queue, i * 10.0, 10.0, false));
            }
          }
          await firstReady;
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          let tasks: Promise<Any>[] = [];
          for (let i: number = 0; i < 50; i++) {
            tasks.push(taskpool.execute(consumerTask, queue, seen, 10.0));
          }
          let producerResults: Any = await Promise.all(producerTasks);
          let producerResultArr: Any[] = producerResults as Any[];
          let totalProduced: number = 0;
          for (let i: int = 0; i < 50; i++) {
            totalProduced += producerResultArr[i] as number;
          }
          let results: Any = await Promise.all(tasks);
          let resultArr: Any[] = results as Any[];
          let totalConsumed: number = 0;
          for (let i: int = 0; i < 50; i++) {
            totalConsumed += resultArr[i] as number;
          }
          expect(totalProduced).assertEqual(500);
          expect(totalConsumed).assertEqual(500);
          expect(seen.size).assertEqual(500);
          for (let i: number = 0; i < 500; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_0600
     * @tc.desc   Verify 100 workers extreme concurrent add and poll on LinkedConcurrentQueue with data integrity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(2000);
          let tasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 100; i++) {
            tasks.push(taskpool.execute(addPollTask, queue, i * 10.0, 10.0));
          }
          let results: Any = await Promise.all(tasks);
          let resultArr: Any[] = results as Any[];
          let totalCompleted: number = 0;
          for (let i: int = 0; i < 100; i++) {
            totalCompleted += resultArr[i] as number;
          }
          expect(totalCompleted).assertEqual(1000);
          expect(queue.isEmpty()).assertTrue();
          expect(queue.size).assertEqual(0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_0700
     * @tc.desc   Verify 1 producer and 1 consumer transfer unique IDs on LinkedConcurrentQueue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(100);
          let producerTasks: Promise<Any>[] = [];
          let firstReady: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
            let readyTask: taskpool.Task = new taskpool.Task(producerTask, queue, 0.0, 10.0, true);
            readyTask.onReceiveData((signal: number): void => {
              if (signal === 1.0) {
                resolve(undefined);
              }
            });
            producerTasks.push(taskpool.execute(readyTask));
          });
          await firstReady;
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          let consumerTasks: Promise<Any>[] = [];
          for (let i: number = 0; i < 1; i++) {
            consumerTasks.push(taskpool.execute(consumerTask, queue, seen, 10.0));
          }
          let producerResults: Any = await Promise.all(producerTasks);
          let producerResultArr: Any[] = producerResults as Any[];
          let totalProduced: number = 0;
          for (let i: int = 0; i < 1; i++) {
            totalProduced += producerResultArr[i] as number;
          }
          let results: Any = await Promise.all(consumerTasks);
          let resultArr: Any[] = results as Any[];
          let totalConsumed: number = 0;
          for (let i: int = 0; i < 1; i++) {
            totalConsumed += resultArr[i] as number;
          }
          expect(totalProduced).assertEqual(10);
          expect(totalConsumed).assertEqual(10);
          expect(seen.size).assertEqual(10);
          for (let i: number = 0; i < 10; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_0800
     * @tc.desc   Verify 3 producers and 3 consumers transfer unique IDs on LinkedConcurrentQueue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(100);
          let producerTasks: Promise<Any>[] = [];
          let firstReady: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
            let readyTask: taskpool.Task = new taskpool.Task(producerTask, queue, 0.0, 10.0, true);
            readyTask.onReceiveData((signal: number): void => {
              if (signal === 1.0) {
                resolve(undefined);
              }
            });
            producerTasks.push(taskpool.execute(readyTask));
          });
          for (let i: number = 1; i < 3; i++) {
            producerTasks.push(taskpool.execute(producerTask, queue, i * 10.0, 10.0, false));
          }
          await firstReady;
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          let consumerTasks: Promise<Any>[] = [];
          for (let i: number = 0; i < 3; i++) {
            consumerTasks.push(taskpool.execute(consumerTask, queue, seen, 10.0));
          }
          let producerResults: Any = await Promise.all(producerTasks);
          let producerResultArr: Any[] = producerResults as Any[];
          let totalProduced: number = 0;
          for (let i: int = 0; i < 3; i++) {
            totalProduced += producerResultArr[i] as number;
          }
          let results: Any = await Promise.all(consumerTasks);
          let resultArr: Any[] = results as Any[];
          let totalConsumed: number = 0;
          for (let i: int = 0; i < 3; i++) {
            totalConsumed += resultArr[i] as number;
          }
          expect(totalProduced).assertEqual(30);
          expect(totalConsumed).assertEqual(30);
          expect(seen.size).assertEqual(30);
          for (let i: number = 0; i < 30; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_0900
     * @tc.desc   Verify 5 producers and 5 consumers transfer unique IDs on LinkedConcurrentQueue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(100);
          let producerTasks: Promise<Any>[] = [];
          let firstReady: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
            let readyTask: taskpool.Task = new taskpool.Task(producerTask, queue, 0.0, 10.0, true);
            readyTask.onReceiveData((signal: number): void => {
              if (signal === 1.0) {
                resolve(undefined);
              }
            });
            producerTasks.push(taskpool.execute(readyTask));
          });
          for (let i: number = 1; i < 5; i++) {
            producerTasks.push(taskpool.execute(producerTask, queue, i * 10.0, 10.0, false));
          }
          await firstReady;
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          let consumerTasks: Promise<Any>[] = [];
          for (let i: number = 0; i < 5; i++) {
            consumerTasks.push(taskpool.execute(consumerTask, queue, seen, 10.0));
          }
          let producerResults: Any = await Promise.all(producerTasks);
          let producerResultArr: Any[] = producerResults as Any[];
          let totalProduced: number = 0;
          for (let i: int = 0; i < 5; i++) {
            totalProduced += producerResultArr[i] as number;
          }
          let results: Any = await Promise.all(consumerTasks);
          let resultArr: Any[] = results as Any[];
          let totalConsumed: number = 0;
          for (let i: int = 0; i < 5; i++) {
            totalConsumed += resultArr[i] as number;
          }
          expect(totalProduced).assertEqual(50);
          expect(totalConsumed).assertEqual(50);
          expect(seen.size).assertEqual(50);
          for (let i: number = 0; i < 50; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_1000
     * @tc.desc   Verify 10 producers and 10 consumers transfer unique IDs on LinkedConcurrentQueue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(200);
          let producerTasks: Promise<Any>[] = [];
          let firstReady: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
            let readyTask: taskpool.Task = new taskpool.Task(producerTask, queue, 0.0, 10.0, true);
            readyTask.onReceiveData((signal: number): void => {
              if (signal === 1.0) {
                resolve(undefined);
              }
            });
            producerTasks.push(taskpool.execute(readyTask));
          });
          for (let i: number = 1; i < 10; i++) {
            producerTasks.push(taskpool.execute(producerTask, queue, i * 10.0, 10.0, false));
          }
          await firstReady;
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          let consumerTasks: Promise<Any>[] = [];
          for (let i: number = 0; i < 10; i++) {
            consumerTasks.push(taskpool.execute(consumerTask, queue, seen, 10.0));
          }
          let producerResults: Any = await Promise.all(producerTasks);
          let producerResultArr: Any[] = producerResults as Any[];
          let totalProduced: number = 0;
          for (let i: int = 0; i < 10; i++) {
            totalProduced += producerResultArr[i] as number;
          }
          let results: Any = await Promise.all(consumerTasks);
          let resultArr: Any[] = results as Any[];
          let totalConsumed: number = 0;
          for (let i: int = 0; i < 10; i++) {
            totalConsumed += resultArr[i] as number;
          }
          expect(totalProduced).assertEqual(100);
          expect(totalConsumed).assertEqual(100);
          expect(seen.size).assertEqual(100);
          for (let i: number = 0; i < 100; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_1100
     * @tc.desc   Verify 50 producers and 50 consumers transfer unique IDs on LinkedConcurrentQueue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(1000);
          let producerTasks: Promise<Any>[] = [];
          let firstReady: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
            let readyTask: taskpool.Task = new taskpool.Task(producerTask, queue, 0.0, 10.0, true);
            readyTask.onReceiveData((signal: number): void => {
              if (signal === 1.0) {
                resolve(undefined);
              }
            });
            producerTasks.push(taskpool.execute(readyTask));
          });
          for (let i: number = 1; i < 50; i++) {
            producerTasks.push(taskpool.execute(producerTask, queue, i * 10.0, 10.0, false));
          }
          await firstReady;
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          let consumerTasks: Promise<Any>[] = [];
          for (let i: number = 0; i < 50; i++) {
            consumerTasks.push(taskpool.execute(consumerTask, queue, seen, 10.0));
          }
          let producerResults: Any = await Promise.all(producerTasks);
          let producerResultArr: Any[] = producerResults as Any[];
          let totalProduced: number = 0;
          for (let i: int = 0; i < 50; i++) {
            totalProduced += producerResultArr[i] as number;
          }
          let results: Any = await Promise.all(consumerTasks);
          let resultArr: Any[] = results as Any[];
          let totalConsumed: number = 0;
          for (let i: int = 0; i < 50; i++) {
            totalConsumed += resultArr[i] as number;
          }
          expect(totalProduced).assertEqual(500);
          expect(totalConsumed).assertEqual(500);
          expect(seen.size).assertEqual(500);
          for (let i: number = 0; i < 500; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_1200
     * @tc.desc   Verify 100 producers and 100 consumers transfer unique IDs on LinkedConcurrentQueue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(2000);
          let producerTasks: Promise<Any>[] = [];
          let firstReady: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
            let readyTask: taskpool.Task = new taskpool.Task(producerTask, queue, 0.0, 10.0, true);
            readyTask.onReceiveData((signal: number): void => {
              if (signal === 1.0) {
                resolve(undefined);
              }
            });
            producerTasks.push(taskpool.execute(readyTask));
          });
          for (let i: number = 1; i < 100; i++) {
            producerTasks.push(taskpool.execute(producerTask, queue, i * 10.0, 10.0, false));
          }
          await firstReady;
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          let consumerTasks: Promise<Any>[] = [];
          for (let i: number = 0; i < 100; i++) {
            consumerTasks.push(taskpool.execute(consumerTask, queue, seen, 10.0));
          }
          let producerResults: Any = await Promise.all(producerTasks);
          let producerResultArr: Any[] = producerResults as Any[];
          let totalProduced: number = 0;
          for (let i: int = 0; i < 100; i++) {
            totalProduced += producerResultArr[i] as number;
          }
          let results: Any = await Promise.all(consumerTasks);
          let resultArr: Any[] = results as Any[];
          let totalConsumed: number = 0;
          for (let i: int = 0; i < 100; i++) {
            totalConsumed += resultArr[i] as number;
          }
          expect(totalProduced).assertEqual(1000);
          expect(totalConsumed).assertEqual(1000);
          expect(seen.size).assertEqual(1000);
          for (let i: number = 0; i < 1000; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_1300
     * @tc.desc   Verify bounded add=false exact count on LinkedConcurrentQueue (Q-2.3-01)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let queue: containers.stackless.ConcurrentQueue<number> =
          new containers.stackless.LinkedConcurrentQueue<number>(5);
        let added: number = 0;
        for (let i: number = 0; i < 5; i++) {
          if (queue.add(i)) {
            added++;
          }
        }
        expect(added).assertEqual(5);
        expect(queue.size).assertEqual(5);
        expect(queue.remainingCapacity()).assertEqual(0);
        let rejected: number = 0;
        for (let i: number = 5; i < 15; i++) {
          if (!queue.add(i)) {
            rejected++;
          }
        }
        expect(rejected).assertEqual(10);
        expect(queue.size).assertEqual(5);
        expect(queue.remainingCapacity()).assertEqual(0);
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_1400
     * @tc.desc   Verify empty poll=undefined exact count on LinkedConcurrentQueue (Q-2.3-02)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let queue: containers.stackless.ConcurrentQueue<number> =
          new containers.stackless.LinkedConcurrentQueue<number>(10);
        let emptyPolls: number = 0;
        for (let i: number = 0; i < 10; i++) {
          if (queue.poll() === undefined) {
            emptyPolls++;
          }
        }
        expect(emptyPolls).assertEqual(10);
        expect(queue.isEmpty()).assertTrue();
        expect(queue.add(7)).assertTrue();
        expect(queue.add(8)).assertTrue();
        expect(queue.poll()).assertEqual(7);
        expect(queue.poll()).assertEqual(8);
        expect(queue.poll()).assertEqual(undefined);
        expect(queue.isEmpty()).assertTrue();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_1500
     * @tc.desc   Verify full queue push blocks until slot released (Q-2.3-03)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(5);
          for (let i: number = 0; i < 5; i++) {
            expect(queue.add(i)).assertTrue();
          }
          expect(queue.remainingCapacity()).assertEqual(0);
          let pushTasks: Promise<Any>[] = [];
          let pushStarted: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
            let t: taskpool.Task = new taskpool.Task(pushBlockTask, queue, 100.0, 1.0);
            t.onReceiveData((signal: number): void => {
              if (signal === 1.0) {
                resolve(undefined);
              }
            });
            pushTasks.push(taskpool.execute(t));
          });
          await pushStarted;
          expect(queue.poll()).assertEqual(0);
          let pushResults: Any = await Promise.all(pushTasks);
          expect(pushResults[0] as number).assertEqual(1);
          expect(queue.size).assertEqual(5);
          expect(queue.getFirst()).assertEqual(1);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_1600
     * @tc.desc   Verify empty queue pop blocks until producer adds value (Q-2.3-04)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(5);
          let popTasks: Promise<Any>[] = [];
          let popStarted: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
            let t: taskpool.Task = new taskpool.Task(popBlockTask, queue, 1.0);
            t.onReceiveData((signal: number): void => {
              if (signal === 1.0) {
                resolve(undefined);
              }
            });
            popTasks.push(taskpool.execute(t));
          });
          await popStarted;
          expect(queue.add(42)).assertTrue();
          let popResults: Any = await Promise.all(popTasks);
          expect(popResults[0] as number).assertEqual(42);
          expect(queue.isEmpty()).assertTrue();
          expect(queue.size).assertEqual(0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_1700
     * @tc.desc   Verify concurrent add no loss/no duplicate (Q-2.3-05)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(1000);
          let tasks: Promise<Any>[] = [];
          for (let i: number = 0; i < 3; i++) {
            tasks.push(taskpool.execute(addOnlyTask, queue, i * 100.0, 100.0));
          }
          let results: Any = await Promise.all(tasks);
          let resultArr: Any[] = results as Any[];
          expect(resultArr[0] as number).assertEqual(100);
          expect(resultArr[1] as number).assertEqual(100);
          expect(resultArr[2] as number).assertEqual(100);
          expect(queue.size).assertEqual(300);
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          let drained: number = 0;
          for (let i: number = 0; i < 300; i++) {
            let item: number | undefined = queue.poll();
            if (item !== undefined) {
              seen.add(item);
              drained++;
            }
          }
          expect(drained).assertEqual(300);
          expect(seen.size).assertEqual(300);
          for (let i: number = 0; i < 300; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_1800
     * @tc.desc   Verify concurrent poll no duplicate consumption (Q-2.3-06)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(500);
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          for (let i: number = 0; i < 300; i++) {
            expect(queue.add(i)).assertTrue();
          }
          let tasks: Promise<Any>[] = [];
          for (let i: number = 0; i < 3; i++) {
            tasks.push(taskpool.execute(consumerTask, queue, seen, 100.0));
          }
          let results: Any = await Promise.all(tasks);
          let resultArr: Any[] = results as Any[];
          expect(resultArr[0] as number).assertEqual(100);
          expect(resultArr[1] as number).assertEqual(100);
          expect(resultArr[2] as number).assertEqual(100);
          expect(seen.size).assertEqual(300);
          for (let i: number = 0; i < 300; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_1900
     * @tc.desc   Verify scale 1 add/poll exact count and FIFO order (Q-2.4-01)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let queue: containers.stackless.ConcurrentQueue<number> =
          new containers.stackless.LinkedConcurrentQueue<number>(10);
        let added: number = 0;
        let N: number = 1;
        for (let i: number = 0; i < N; i++) {
          if (queue.add(i)) {
            added++;
          }
        }
        expect(added).assertEqual(N);
        expect(queue.size).assertEqual(N);
        let polled: number = 0;
        let mismatches: number = 0;
        for (let i: number = 0; i < N; i++) {
          let item: number | undefined = queue.poll();
          if (item === undefined) {
            mismatches++;
          } else if (item !== i) {
            mismatches++;
          }
          polled++;
        }
        expect(polled).assertEqual(N);
        expect(mismatches).assertEqual(0);
        expect(queue.isEmpty()).assertTrue();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_2000
     * @tc.desc   Verify scale 10 add/poll exact count and FIFO order (Q-2.4-02)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let queue: containers.stackless.ConcurrentQueue<number> =
          new containers.stackless.LinkedConcurrentQueue<number>(20);
        let N: number = 10;
        let added: number = 0;
        for (let i: number = 0; i < N; i++) {
          if (queue.add(i)) {
            added++;
          }
        }
        expect(added).assertEqual(N);
        expect(queue.size).assertEqual(N);
        let polled: number = 0;
        let mismatches: number = 0;
        for (let i: number = 0; i < N; i++) {
          let item: number | undefined = queue.poll();
          if (item === undefined) {
            mismatches++;
          } else if (item !== i) {
            mismatches++;
          }
          polled++;
        }
        expect(polled).assertEqual(N);
        expect(mismatches).assertEqual(0);
        expect(queue.isEmpty()).assertTrue();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_2100
     * @tc.desc   Verify scale 100 add/poll exact count and FIFO order (Q-2.4-03)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let queue: containers.stackless.ConcurrentQueue<number> =
          new containers.stackless.LinkedConcurrentQueue<number>(200);
        let N: number = 100;
        let added: number = 0;
        for (let i: number = 0; i < N; i++) {
          if (queue.add(i)) {
            added++;
          }
        }
        expect(added).assertEqual(N);
        expect(queue.size).assertEqual(N);
        let polled: number = 0;
        let mismatches: number = 0;
        for (let i: number = 0; i < N; i++) {
          let item: number | undefined = queue.poll();
          if (item === undefined) {
            mismatches++;
          } else if (item !== i) {
            mismatches++;
          }
          polled++;
        }
        expect(polled).assertEqual(N);
        expect(mismatches).assertEqual(0);
        expect(queue.isEmpty()).assertTrue();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_2200
     * @tc.desc   Verify scale 1K add/poll exact count and FIFO order (Q-2.4-04)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let queue: containers.stackless.ConcurrentQueue<number> =
          new containers.stackless.LinkedConcurrentQueue<number>(2000);
        let N: number = 1000;
        let added: number = 0;
        for (let i: number = 0; i < N; i++) {
          if (queue.add(i)) {
            added++;
          }
        }
        expect(added).assertEqual(N);
        expect(queue.size).assertEqual(N);
        let polled: number = 0;
        let mismatches: number = 0;
        for (let i: number = 0; i < N; i++) {
          let item: number | undefined = queue.poll();
          if (item === undefined) {
            mismatches++;
          } else if (item !== i) {
            mismatches++;
          }
          polled++;
        }
        expect(polled).assertEqual(N);
        expect(mismatches).assertEqual(0);
        expect(queue.isEmpty()).assertTrue();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_2300
     * @tc.desc   Verify scale 10K add/poll exact count and FIFO order (Q-2.4-05)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let queue: containers.stackless.ConcurrentQueue<number> =
          new containers.stackless.LinkedConcurrentQueue<number>(10000);
        let N: number = 10000;
        let added: number = 0;
        for (let i: number = 0; i < N; i++) {
          if (queue.add(i)) {
            added++;
          }
        }
        expect(added).assertEqual(N);
        expect(queue.size).assertEqual(N);
        let polled: number = 0;
        let mismatches: number = 0;
        for (let i: number = 0; i < N; i++) {
          let item: number | undefined = queue.poll();
          if (item === undefined) {
            mismatches++;
          } else if (item !== i) {
            mismatches++;
          }
          polled++;
        }
        expect(polled).assertEqual(N);
        expect(mismatches).assertEqual(0);
        expect(queue.isEmpty()).assertTrue();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_2400
     * @tc.desc   Verify nested TaskPool depth 1 with awaitable completion (Q-2.5-01)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(100);
          let result: Any = await taskpool.execute(nestedQueueTask, queue, 1.0, 1.0, 0.0, 10.0);
          expect(result as number).assertEqual(10);
          expect(queue.size).assertEqual(10);
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          for (let i: number = 0; i < 10; i++) {
            let item: number | undefined = queue.poll();
            if (item !== undefined) {
              seen.add(item);
            }
          }
          expect(seen.size).assertEqual(10);
          for (let i: number = 0; i < 10; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_2500
     * @tc.desc   Verify nested TaskPool depth 2 with awaitable completion (Q-2.5-02)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(100);
          let result: Any = await taskpool.execute(nestedQueueTask, queue, 1.0, 2.0, 0.0, 10.0);
          expect(result as number).assertEqual(10);
          expect(queue.size).assertEqual(10);
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          for (let i: number = 0; i < 10; i++) {
            let item: number | undefined = queue.poll();
            if (item !== undefined) {
              seen.add(item);
            }
          }
          expect(seen.size).assertEqual(10);
          for (let i: number = 0; i < 10; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_2600
     * @tc.desc   Verify nested TaskPool depth 3 with awaitable completion (Q-2.5-03)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(100);
          let result: Any = await taskpool.execute(nestedQueueTask, queue, 1.0, 3.0, 0.0, 10.0);
          expect(result as number).assertEqual(10);
          expect(queue.size).assertEqual(10);
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          for (let i: number = 0; i < 10; i++) {
            let item: number | undefined = queue.poll();
            if (item !== undefined) {
              seen.add(item);
            }
          }
          expect(seen.size).assertEqual(10);
          for (let i: number = 0; i < 10; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_2700
     * @tc.desc   Verify nested TaskPool depth 5 with awaitable completion (Q-2.5-04)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(100);
          let result: Any = await taskpool.execute(nestedQueueTask, queue, 1.0, 5.0, 0.0, 10.0);
          expect(result as number).assertEqual(10);
          expect(queue.size).assertEqual(10);
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          for (let i: number = 0; i < 10; i++) {
            let item: number | undefined = queue.poll();
            if (item !== undefined) {
              seen.add(item);
            }
          }
          expect(seen.size).assertEqual(10);
          for (let i: number = 0; i < 10; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_2800
     * @tc.desc   Verify producer-consumer practice with ID 1-to-1 correspondence (Q-3.1-01)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(200);
          let producerTasks: Promise<Any>[] = [];
          let firstReady: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
            let readyTask: taskpool.Task = new taskpool.Task(producerTask, queue, 0.0, 25.0, true);
            readyTask.onReceiveData((signal: number): void => {
              if (signal === 1.0) {
                resolve(undefined);
              }
            });
            producerTasks.push(taskpool.execute(readyTask));
          });
          producerTasks.push(taskpool.execute(producerTask, queue, 25.0, 25.0, false));
          await firstReady;
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          let consumerTasks: Promise<Any>[] = [];
          for (let i: number = 0; i < 2; i++) {
            consumerTasks.push(taskpool.execute(consumerTask, queue, seen, 25.0));
          }
          let producerResults: Any = await Promise.all(producerTasks);
          let producerResultArr: Any[] = producerResults as Any[];
          let totalProduced: number = 0;
          for (let i: int = 0; i < 2; i++) {
            totalProduced += producerResultArr[i] as number;
          }
          let results: Any = await Promise.all(consumerTasks);
          let resultArr: Any[] = results as Any[];
          let totalConsumed: number = 0;
          for (let i: int = 0; i < 2; i++) {
            totalConsumed += resultArr[i] as number;
          }
          expect(totalProduced).assertEqual(50);
          expect(totalConsumed).assertEqual(50);
          expect(seen.size).assertEqual(50);
          for (let i: number = 0; i < 50; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_2900
     * @tc.desc   Verify task scheduling: submitted IDs equal executed IDs (Q-3.2-01)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(100);
          for (let i: number = 0; i < 30; i++) {
            expect(queue.add(i)).assertTrue();
          }
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          let tasks: Promise<Any>[] = [];
          for (let i: number = 0; i < 3; i++) {
            tasks.push(taskpool.execute(consumerTask, queue, seen, 10.0));
          }
          let results: Any = await Promise.all(tasks);
          let resultArr: Any[] = results as Any[];
          let executed: number = 0;
          for (let i: int = 0; i < 3; i++) {
            executed += resultArr[i] as number;
          }
          expect(executed).assertEqual(30);
          expect(seen.size).assertEqual(30);
          for (let i: number = 0; i < 30; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_3000
     * @tc.desc   Verify event messaging: event IDs complete (Q-3.3-01)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(200);
          let producerTasks: Promise<Any>[] = [];
          let firstReady: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
            let readyTask: taskpool.Task = new taskpool.Task(producerTask, queue, 0.0, 20.0, true);
            readyTask.onReceiveData((signal: number): void => {
              if (signal === 1.0) {
                resolve(undefined);
              }
            });
            producerTasks.push(taskpool.execute(readyTask));
          });
          for (let i: number = 1; i < 3; i++) {
            producerTasks.push(taskpool.execute(producerTask, queue, i * 20.0, 20.0, false));
          }
          await firstReady;
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          let consumerTasks: Promise<Any>[] = [];
          for (let i: number = 0; i < 3; i++) {
            consumerTasks.push(taskpool.execute(consumerTask, queue, seen, 20.0));
          }
          let producerResults: Any = await Promise.all(producerTasks);
          let producerResultArr: Any[] = producerResults as Any[];
          let totalProduced: number = 0;
          for (let i: int = 0; i < 3; i++) {
            totalProduced += producerResultArr[i] as number;
          }
          let results: Any = await Promise.all(consumerTasks);
          let resultArr: Any[] = results as Any[];
          let totalConsumed: number = 0;
          for (let i: int = 0; i < 3; i++) {
            totalConsumed += resultArr[i] as number;
          }
          expect(totalProduced).assertEqual(60);
          expect(totalConsumed).assertEqual(60);
          expect(seen.size).assertEqual(60);
          for (let i: number = 0; i < 60; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_3100
     * @tc.desc   Verify log collection: log IDs complete (Q-3.4-01)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(200);
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          let tasks: Promise<Any>[] = [];
          for (let i: number = 0; i < 4; i++) {
            tasks.push(taskpool.execute(producerTask, queue, i * 10.0, 10.0, false));
          }
          for (let i: number = 0; i < 4; i++) {
            tasks.push(taskpool.execute(consumerTask, queue, seen, 10.0));
          }
          let results: Any = await Promise.all(tasks);
          let resultArr: Any[] = results as Any[];
          let totalProduced: number = 0;
          let totalConsumed: number = 0;
          for (let i: int = 0; i < 4; i++) {
            totalProduced += resultArr[i] as number;
            totalConsumed += resultArr[i + 4] as number;
          }
          expect(totalProduced).assertEqual(40);
          expect(totalConsumed).assertEqual(40);
          expect(seen.size).assertEqual(40);
          for (let i: number = 0; i < 40; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_3200
     * @tc.desc   Verify fixed capacity full add=false count exact (Q-4.1-01)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let queue: containers.stackless.ConcurrentQueue<number> =
          new containers.stackless.LinkedConcurrentQueue<number>(7);
        let added: number = 0;
        for (let i: number = 0; i < 7; i++) {
          if (queue.add(i)) {
            added++;
          }
        }
        expect(added).assertEqual(7);
        expect(queue.size).assertEqual(7);
        expect(queue.remainingCapacity()).assertEqual(0);
        let rejected: number = 0;
        for (let i: number = 7; i < 10; i++) {
          if (!queue.add(i)) {
            rejected++;
          }
        }
        expect(rejected).assertEqual(3);
        expect(queue.size).assertEqual(7);
        expect(queue.poll()).assertEqual(0);
        expect(queue.remainingCapacity()).assertEqual(1);
        expect(queue.add(100)).assertTrue();
        expect(queue.size).assertEqual(7);
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_3300
     * @tc.desc   Verify configurable capacity stores exactly capacity elements (Q-4.1-02)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let queue: containers.stackless.ConcurrentQueue<number> =
          new containers.stackless.LinkedConcurrentQueue<number>(5);
        for (let i: number = 0; i < 5; i++) {
          expect(queue.add(i)).assertTrue();
        }
        expect(queue.size).assertEqual(5);
        expect(queue.capacity).assertEqual(5);
        expect(queue.remainingCapacity()).assertEqual(0);
        expect(queue.add(5)).assertFalse();
        expect(queue.size).assertEqual(5);
        for (let i: number = 0; i < 5; i++) {
          expect(queue.poll()).assertEqual(i);
        }
        expect(queue.isEmpty()).assertTrue();
        expect(queue.remainingCapacity()).assertEqual(5);
      });

    /**
      * @tc.name   ConcurrentQueueHighConcurrencyTest3400
      * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_3400
     * @tc.desc   Verify LinkedConcurrentQueue getEnd returns exact tail element (Q-4.1-04)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let queue: containers.stackless.LinkedConcurrentQueue<number> =
          new containers.stackless.LinkedConcurrentQueue<number>();
        expect(queue.getEnd()).assertEqual(undefined);
        queue.add(3);
        queue.add(5);
        queue.add(7);
        expect(queue.getEnd()).assertEqual(7);
        expect(queue.getFirst()).assertEqual(3);
        queue.add(9);
        expect(queue.getEnd()).assertEqual(9);
        expect(queue.poll()).assertEqual(3);
        expect(queue.getEnd()).assertEqual(9);
        expect(queue.poll()).assertEqual(5);
        expect(queue.poll()).assertEqual(7);
        expect(queue.getEnd()).assertEqual(9);
        expect(queue.poll()).assertEqual(9);
        expect(queue.getEnd()).assertEqual(undefined);
        expect(queue.isEmpty()).assertTrue();
      });

    /**
      * @tc.name   ConcurrentQueueHighConcurrencyTest3500
      * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_3500
     * @tc.desc   Verify main + 20 child full API overlap with strong invariants (Q-6-01)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(500);
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          let tasks: Promise<Any>[] = [];
          for (let i: number = 0; i < 20; i++) {
            tasks.push(taskpool.execute(fullApiParticipant, queue, i * 10.0, 5.0, seen));
          }
          let mainResult: number = await fullApiParticipant(queue, 200, 5, seen);
          let results: Any = await Promise.all(tasks);
          let resultArr: Any[] = results as Any[];
          for (let i: int = 0; i < 20; i++) {
            expect(resultArr[i] as number).assertEqual(10);
          }
          expect(mainResult).assertEqual(10);
          expect(seen.size).assertEqual(210);
          for (let i: number = 0; i < 210; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
          expect(queue.size).assertEqual(0);
          expect(queue.remainingCapacity()).assertEqual(500);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
      * @tc.name   ConcurrentQueueHighConcurrencyTest3600
      * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_3600
     * @tc.desc   Verify Linked + 50 child full API overlap with strong invariants (Q-6-03)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(500);
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          let tasks: Promise<Any>[] = [];
          for (let i: number = 0; i < 50; i++) {
            tasks.push(taskpool.execute(fullApiParticipant, queue, i * 4.0, 2.0, seen));
          }
          let mainResult: number = await fullApiParticipant(queue, 200, 2, seen);
          let results: Any = await Promise.all(tasks);
          let resultArr: Any[] = results as Any[];
          for (let i: int = 0; i < 50; i++) {
            expect(resultArr[i] as number).assertEqual(4);
          }
          expect(mainResult).assertEqual(4);
          expect(seen.size).assertEqual(204);
          for (let i: number = 0; i < 204; i++) {
            expect(seen.has(i)).assertTrue();
          }
          expect(queue.isEmpty()).assertTrue();
          expect(queue.size).assertEqual(0);
          expect(queue.remainingCapacity()).assertEqual(500);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
      * @tc.name   ConcurrentQueueHighConcurrencyTest3700
      * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_3700
     * @tc.desc   Verify main/sub producer-consumer full API, produced/consumed exact (Q-6-04)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(200);
          let mainProduced: number = 0;
          for (let i: number = 0; i < 30; i++) {
            await queue.push(i);
            mainProduced++;
          }
          expect(mainProduced).assertEqual(30);
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          let tasks: Promise<Any>[] = [];
          for (let i: number = 0; i < 6; i++) {
            tasks.push(taskpool.execute(popCollectTask, queue, seen, 5.0));
          }
          for (let i: number = 0; i < 6; i++) {
            tasks.push(taskpool.execute(addOnlyTask, queue, 30.0 + i * 5.0, 5.0));
          }
          let results: Any = await Promise.all(tasks);
          let resultArr: Any[] = results as Any[];
          let childrenConsumed: number = 0;
          for (let i: int = 0; i < 6; i++) {
            childrenConsumed += resultArr[i] as number;
          }
          let childrenProduced: number = 0;
          for (let i: int = 6; i < 12; i++) {
            childrenProduced += resultArr[i] as number;
          }
          expect(childrenConsumed).assertEqual(30);
          expect(childrenProduced).assertEqual(30);
          let mainConsumed: number = 0;
          for (let i: number = 0; i < 30; i++) {
            let item: number | undefined = queue.poll();
            if (item !== undefined) {
              seen.add(item);
              mainConsumed++;
            }
          }
          expect(mainConsumed).assertEqual(30);
          expect(queue.isEmpty()).assertTrue();
          expect(seen.size).assertEqual(60);
          for (let i: number = 0; i < 60; i++) {
            expect(seen.has(i)).assertTrue();
          }
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
      * @tc.name   ConcurrentQueueHighConcurrencyTest3800
      * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_3800
     * @tc.desc   Verify full/empty boundary outcomes with main+child concurrency (Q-6-05)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(4);
          for (let i: number = 0; i < 4; i++) {
            expect(queue.add(i)).assertTrue();
          }
          expect(queue.size).assertEqual(4);
          expect(queue.add(4)).assertFalse();
          expect(queue.remainingCapacity()).assertEqual(0);
          let pushTasks: Promise<Any>[] = [];
          let pushStarted: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
            let t: taskpool.Task = new taskpool.Task(pushBlockTask, queue, 99.0, 1.0);
            t.onReceiveData((signal: number): void => {
              if (signal === 1.0) {
                resolve(undefined);
              }
            });
            pushTasks.push(taskpool.execute(t));
          });
          await pushStarted;
          expect(queue.poll()).assertEqual(0);
          let pushResults: Any = await Promise.all(pushTasks);
          expect(pushResults[0] as number).assertEqual(1);
          expect(queue.size).assertEqual(4);
          expect(queue.getFirst()).assertEqual(1);
          expect(queue.poll()).assertEqual(1);
          expect(queue.poll()).assertEqual(2);
          expect(queue.poll()).assertEqual(3);
          expect(queue.poll()).assertEqual(99);
          expect(queue.poll()).assertEqual(undefined);
          expect(queue.isEmpty()).assertTrue();
          let popTasks: Promise<Any>[] = [];
          let popStarted: Promise<void> = new Promise<void>((resolve: (value: void) => void): void => {
            let t: taskpool.Task = new taskpool.Task(popBlockTask, queue, 1.0);
            t.onReceiveData((signal: number): void => {
              if (signal === 1.0) {
                resolve(undefined);
              }
            });
            popTasks.push(taskpool.execute(t));
          });
          await popStarted;
          expect(queue.add(42)).assertTrue();
          let popResults: Any = await Promise.all(popTasks);
          expect(popResults[0] as number).assertEqual(42);
          expect(queue.isEmpty()).assertTrue();
          expect(queue.size).assertEqual(0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });

    /**
     * @tc.name   ConcurrentQueueHighConcurrencyTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENT_QUEUE_HIGH_CONCURRENCY_3900
     * @tc.desc   Verify scale 100K: 10 TaskPool producers each add 10000 unique IDs to a capacity-100000 LinkedConcurrentQueue, then drain 100000 items and verify the exact unique ID set without cross-producer FIFO order assumptions (Q-2.4-06)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentQueueHighConcurrencyTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          let queue: containers.stackless.ConcurrentQueue<number> =
            new containers.stackless.LinkedConcurrentQueue<number>(100000);
          let totalItems: number = 100000;
          let itemsPerProducer: number = 10000;
          let tasks: Promise<Any>[] = [];
          for (let i: int = 0; i < 10; i++) {
            tasks.push(taskpool.execute(producerTask, queue, i * itemsPerProducer, itemsPerProducer, false));
          }
          let results: Any = await Promise.all(tasks);
          let resultArr: Any[] = results as Any[];
          let produced: number = 0;
          for (let i: int = 0; i < 10; i++) {
            expect(resultArr[i] as number).assertEqual(itemsPerProducer);
            produced += resultArr[i] as number;
          }
          expect(produced).assertEqual(totalItems);
          expect(queue.size).assertEqual(totalItems);
          let seen: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>();
          let polled: number = 0;
          let pollUndefined: number = 0;
          for (let i: number = 0; i < totalItems; i++) {
            let item: number | undefined = queue.poll();
            if (item !== undefined) {
              seen.add(item);
            } else {
              pollUndefined++;
            }
            polled++;
          }
          expect(polled).assertEqual(totalItems);
          expect(pollUndefined).assertEqual(0);
          expect(seen.size).assertEqual(totalItems);
          let missingIds: number = 0;
          for (let id: number = 0; id < totalItems; id++) {
            if (!seen.has(id)) {
              missingIds++;
            }
          }
          expect(missingIds).assertEqual(0);
          expect(queue.isEmpty()).assertTrue();
          expect(queue.size).assertEqual(0);
        } catch (error) {
          expect(error).assertFail();
        }
        done();
      });
  });
}
