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

import { describe, beforeAll, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util.test';

// ========== 辅助函数 ==========
function simpleTask(): string {
  return "result";
}

function longTask(duration: number): string {
  let start: number = Date.now();
  while ((Date.now() - start) < duration) { continue; }
  return 'success';
}

function slowTask(): string {
  let start: number = Date.now();
  while ((Date.now() - start) < 2500) { continue; }
  return 'slow';
}

function returnNumber(): number {
  return 42;
}

function returnString(): string {
  return "hello";
}

function returnObject(): Record<string, number> {
  let obj: Record<string, number> = {};
  obj["key"] = 1;
  return obj;
}

function returnArray(): number[] {
  return [1, 2, 3];
}

function emptyStringTask(): string {
  return "";
}

function concurrentTask(id: number): number {
  return id * 10;
}

function fastTask(): string {
  return "fast";
}

// ========== Coverage-gap helpers (GAP_BOTH) ==========

// Shared counter object for main-thread state bookkeeping in IP-002/IP-003 flows.
class CounterObj {
  public count: number;
  constructor(value: number) {
    this.count = value;
  }
}

function returnMapTask(): Map<string, number> {
  let map: Map<string, number> = new Map<string, number>();
  map.set("key", 1);
  return map;
}

function returnSetTask(): Set<number> {
  let set: Set<number> = new Set<number>();
  set.add(1);
  set.add(2);
  set.add(3);
  return set;
}

function atomicCountTask(counter: AtomicInt): void {
  let start: number = Date.now();
  while ((Date.now() - start) < 1500) { continue; }
  counter.fetchAdd(1);
}

function atomicFlagTask(flag: AtomicInt): void {
  let start: number = Date.now();
  while ((Date.now() - start) < 2000) { continue; }
  flag.store(1);
}

function rejectPromiseTask(): Promise<string> {
  return new Promise<string>((resolve: (value: string) => void, reject: (reason: Error) => void) => {
    reject(new Error("task error"));
  });
}

function timerDelayTask(): Promise<string> {
  return new Promise<string>((resolve: (value: string) => void) => {
    setTimeout((): void => {
      resolve("timed");
    }, 500);
  });
}

async function nestedAsyncTask(): Promise<string> {
  try {
    await new Promise<string>((resolve: (value: string) => void) => {
      setTimeout((): void => {
        resolve("step1");
      }, 5000);
    });
  } catch (error) {
    expect().assertFail();
  }
  return "nested";
}

async function promiseChainTask(): Promise<number> {
  let first: number = 0;
  try {
    first = await new Promise<number>((resolve: (value: number) => void) => {
      setTimeout((): void => {
        resolve(1);
      }, 1667);
    });
  } catch (error) {
    expect().assertFail();
  }
  let second: number = 0;
  try {
    second = await new Promise<number>((resolve: (value: number) => void) => {
      setTimeout((): void => {
        resolve(first + 1);
      }, 3333);
    });
  } catch (error) {
    expect().assertFail();
  }
  return second;
}

function isCanceledCheckTask(flag: AtomicInt): string {
  let start: number = Date.now();
  while ((Date.now() - start) < 2000) {
    if (taskpool.Task.isCanceled()) {
      flag.store(1);
    }
    continue;
  }
  return "done";
}

function slowThrowTask(): string {
  let start: number = Date.now();
  while ((Date.now() - start) < 5000) { continue; }
  throw new Error("slow task error");
}

function loopCountTask(): number {
  let count: number = 0;
  for (let i: number = 0; i < 10000; i++) {
    count++;
  }
  return count;
}

function nestedLoopTask(): number {
  let count: number = 0;
  for (let i: number = 0; i < 100; i++) {
    for (let j: number = 0; j < 100; j++) {
      count++;
    }
  }
  return count;
}

function heavyLoopTask(): number {
  let count: number = 0;
  let start: number = Date.now();
  for (let i: number = 0; i < 1000000; i++) {
    count++;
  }
  while ((Date.now() - start) < 1000) { continue; }
  return count;
}

function bigDataTask(): Uint8Array {
  let data: Uint8Array = new Uint8Array(100 * 1024 * 1024);
  data[0] = 1;
  data[data.length - 1] = 2;
  return data;
}

function bigDataTimeoutTask(): Uint8Array {
  let start: number = Date.now();
  while ((Date.now() - start) < 5000) { continue; }
  let data: Uint8Array = new Uint8Array(100 * 1024 * 1024);
  data[0] = 3;
  data[data.length - 1] = 4;
  return data;
}

function dbQueryTask(): string {
  let start: number = Date.now();
  while ((Date.now() - start) < 25000) { continue; }
  return "query-done";
}

function weakNetworkTask(): string {
  let start: number = Date.now();
  while ((Date.now() - start) < 10000) { continue; }
  return "network-ok";
}

function rollbackDbTransaction(): string {
  return "rolled-back";
}

async function networkRetryLoop(maxAttempts: number, retryCounter: CounterObj, degradedFlag: CounterObj): Promise<void> {
  while (retryCounter.count < maxAttempts) {
    let task: taskpool.Task = new taskpool.Task(weakNetworkTask);
    let rejected: boolean = false;
    try {
      await taskpool.execute(task, { timeout: 2000 });
    } catch (error) {
      rejected = true;
    }
    if (rejected) {
      retryCounter.count++;
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
    } else {
      break;
    }
  }
  if (retryCounter.count >= maxAttempts) {
    degradedFlag.count = 1;
  }
}

export default function TaskpoolExecuteTaskTest(): void {
  describe('TaskpoolExecuteTaskTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})

    /**
     * @tc.name   TaskpoolExecute3Test0100

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_0100

     * @tc.desc   Verify execute(task, configs) with both required params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute3Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let configs: taskpool.Configs = { timeout: 1000, priority: taskpool.Priority.HIGH };
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, configs);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("result");
      done();
    })

    // ==================== 1.2 configs参数组合 ====================

    /**
     * @tc.name   TaskpoolExecute3Test0200

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_0200

     * @tc.desc   Verify configs with only timeout set, priority defaults to MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute3Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longTask, 500.0);
      let configs: taskpool.Configs = { timeout: 1000.0 };
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, configs);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual('success');
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test0300

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_0300

     * @tc.desc   Verify configs with only priority set, timeout defaults to Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute3Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let configs: taskpool.Configs = { priority: taskpool.Priority.LOW };
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, configs);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("result");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test0400

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_0400

     * @tc.desc   Verify configs with empty object, both default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let configs: taskpool.Configs = {};
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, configs);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("result");
      done();
    })

    // ==================== 1.3 timeout参数测试 ====================

    /**
     * @tc.name   TaskpoolExecute3Test0500

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_0500

     * @tc.desc   Verify task timeout when execution exceeds timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute3Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task2: taskpool.Task = new taskpool.Task(longTask, 2500.0);
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(task2, { timeout: 500.0 });
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test0600

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_0600

     * @tc.desc   Verify timeout=0 takes default Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleTask);
      let result1: Any = undefined;
      try {
        result1 = await taskpool.execute(task1, { timeout: 0 });
      } catch (error) {
        expect().assertFail();
      }
      expect(result1 as string).assertEqual("result");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test0700

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_0700

     * @tc.desc   Verify timeout=-1 takes default Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task2: taskpool.Task = new taskpool.Task(simpleTask);
      let result2: Any = undefined;
      try {
        result2 = await taskpool.execute(task2, { timeout: -1 });
      } catch (error) {
        expect().assertFail();
      }
      expect(result2 as string).assertEqual("result");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test0800

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_0800

     * @tc.desc   Verify timeout with large value equivalent to no timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, { timeout: 999999999 });
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("result");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test0900

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_0900

     * @tc.desc   Verify timeout=1ms causes task to timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longTask, 1000.0);
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 1.0 });
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    // ==================== 1.4 priority参数测试 ====================

    /**
     * @tc.name   TaskpoolExecute3Test1000

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_1000

     * @tc.desc   Verify priority HIGH with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute3Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let configs: taskpool.Configs = { priority: taskpool.Priority.HIGH };
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, configs);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("result");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test1100

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_1100

     * @tc.desc   Verify priority MEDIUM with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute3Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let configs: taskpool.Configs = { priority: taskpool.Priority.MEDIUM };
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, configs);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("result");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test1200

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_1200

     * @tc.desc   Verify priority LOW with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute3Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let configs: taskpool.Configs = { priority: taskpool.Priority.LOW };
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, configs);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("result");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test1300

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_1300

     * @tc.desc   Verify priority IDLE with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let configs: taskpool.Configs = { priority: taskpool.Priority.IDLE };
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, configs);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("result");
      done();
    })

    // ==================== 2. 返回值测试 ====================

    /**
     * @tc.name   TaskpoolExecute3Test1400

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_1400

     * @tc.desc   Verify execute returns number correctly with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute3Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnNumber);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, { timeout: 5000 });
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(42);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test1500

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_1500

     * @tc.desc   Verify execute returns string correctly with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute3Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnString);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, { timeout: 5000 });
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("hello");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test1600

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_1600

     * @tc.desc   Verify execute returns object correctly with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute3Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnObject);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, { timeout: 5000 });
      } catch (error) {
        expect().assertFail();
      }
      let record = result as Record<string, number>;
      expect(record["key"]).assertEqual(1);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test1700

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_1700

     * @tc.desc   Verify execute returns array correctly with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute3Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnArray);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, { timeout: 5000 });
      } catch (error) {
        expect().assertFail();
      }
      let arr = result as number[];
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test1800

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_1800

     * @tc.desc   Verify execute returns empty string with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(emptyStringTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, { timeout: 5000 });
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("");
      done();
    })

    // ==================== 3. 错误处理 ====================

    /**
     * @tc.name   TaskpoolExecute3Test1900

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_1900

     * @tc.desc   Verify "task has been executed" error when task re-executed with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute3Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      try {
        await taskpool.execute(task, { timeout: 5000 });
      } catch (error) {
        expect().assertFail();
      }
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 5000 });
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test2000

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_2000

     * @tc.desc   Verify "timeout task with dependency cannot execute" error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute3Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleTask);
      let task2: taskpool.Task = new taskpool.Task(simpleTask);
      task2.addDependency(task1);
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(task2, { timeout: 1000 });
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test2100

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_2100

     * @tc.desc   Verify "timeout task cannot be executed again" error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(slowTask);
      let timeoutCaught: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 500 });
      } catch (error) {
        timeoutCaught = true;
      }
      expect(timeoutCaught).assertTrue();
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 1000 });
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test2200

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_2200

     * @tc.desc   Verify try-catch-finally with timeout, catch and finally both execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute3Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let finallyExecuted: boolean = false;
      let catchExecuted: boolean = false;
      let task: taskpool.Task = new taskpool.Task(slowTask);
      try {
        await taskpool.execute(task, { timeout: 500 });
      } catch (error) {
        catchExecuted = true;
      } finally {
        finallyExecuted = true;
      }
      expect(catchExecuted).assertTrue();
      expect(finallyExecuted).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test2300

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_2300

     * @tc.desc   Verify Error properties when task times out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(slowTask);
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 500 });
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    // ==================== 4. 异步并发 ====================

    /**
     * @tc.name   TaskpoolExecute3Test2400

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_2400

     * @tc.desc   Verify Promise.all with multiple tasks using configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute3Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(concurrentTask, 1.0);
      let task2: taskpool.Task = new taskpool.Task(concurrentTask, 2.0);
      let task3: taskpool.Task = new taskpool.Task(concurrentTask, 3.0);
      let p1 = taskpool.execute(task1, { timeout: 5000.0 });
      let p2 = taskpool.execute(task2, { timeout: 5000.0 });
      let p3 = taskpool.execute(task3, { timeout: 5000.0 });
      let results: Any[] = [];
      try {
        results = (await Promise.all([p1, p2, p3])) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(3);
      expect(results[0] as number).assertEqual(10.0);
      expect(results[1] as number).assertEqual(20.0);
      expect(results[2] as number).assertEqual(30.0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test2500

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_2500

     * @tc.desc   Verify concurrent tasks with configs complete with correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let fastT: taskpool.Task = new taskpool.Task(fastTask);
      let slowT: taskpool.Task = new taskpool.Task(longTask, 500.0);
      let fastPromise = taskpool.execute(fastT, { timeout: 5000 });
      let slowPromise = taskpool.execute(slowT, { timeout: 5000 });
      let fastResult: Any = undefined;
      try {
        fastResult = await fastPromise;
      } catch (error) {
        expect().assertFail();
      }
      expect(fastResult as string).assertEqual("fast");
      let slowResult: Any = undefined;
      try {
        slowResult = await slowPromise;
      } catch (error) {
        expect().assertFail();
      }
      expect(slowResult as string).assertEqual("success");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test2600

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_2600

     * @tc.desc   Verify execute with configs returns task result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, { timeout: 5000.0 });
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("result");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test2700

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_2700

     * @tc.desc   Verify catch captures timeout error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let errorMsg: string = "";
      let task: taskpool.Task = new taskpool.Task(slowTask);
      try {
        await taskpool.execute(task, { timeout: 500 });
      } catch (error) {
        errorMsg = "caught"
      }
      expect(errorMsg).assertEqual("caught");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test2800

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_2800

     * @tc.desc   Verify finally always executes with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute3Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let finallyExecuted: boolean = false;
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      try {
        await taskpool.execute(task, { timeout: 5000 });
      } catch (error) {
        expect().assertFail();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test2900

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_2900

     * @tc.desc   Verify cancel during running does not reject execute(task, configs)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longTask, 1000.0);
      let executePromise = taskpool.execute(task, { timeout: 2000 });
      // 轮询确认任务已 RUNNING 再取消（固定 500ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running2900: boolean = false;
      let begin2900: number = Date.now();
      while (!running2900 && Date.now() - begin2900 < 10000) {
        let poolInfo2900: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let taskInfo of poolInfo2900.taskInfos) {
          if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
            running2900 = true;
          }
        }
        if (!running2900) {
          try {
            await Utils.msSleep(20);
          } catch (error) {
            expect().assertFail();
          }
        }
      }
      expect(running2900).assertTrue();
      taskpool.cancel(task);
      try {
        let result: string = await executePromise as string;
        expect(result).assertEqual('success');
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    // ==================== 5. Coverage gap tests (GAP_BOTH) ====================

    /**
     * @tc.name   TaskpoolExecute3Test3000

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_3000

     * @tc.desc   Verify execute(task, configs) at equal timeout boundary (500ms task, timeout=500) settles with valid outcome
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longTask, 500.0);
      let ok: boolean = false;
      let timedOut: boolean = false;
      let r: string = '';
      try {
        r = await taskpool.execute(task, { timeout: 500 }) as string;
        ok = true;
      } catch (error) {
        timedOut = true;
      }
      if (ok) {
        expect(r).assertEqual('success');
      } else {
        expect(timedOut).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test3100

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_3100

     * @tc.desc   Verify execute(task, configs) rejects for a task belonging to a TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      taskGroup.addTask(task);
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 1000 });
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test3200

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_3200

     * @tc.desc   Verify execute(task, configs) rejects for a task belonging to a SequenceRunner
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let seqRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let runnerPromise = seqRunner.execute(task);
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 1000 });
      } catch (error) {
        errorCaught = true;
      }
      try {
        await runnerPromise;
      } catch (error) {
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test3300

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_3300

     * @tc.desc   Verify execute(task, configs) rejects for a task belonging to an AsyncRunner
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let asyncRunner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2);
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let runnerPromise = asyncRunner.execute(task);
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 1000 });
      } catch (error) {
        errorCaught = true;
      }
      try {
        await runnerPromise;
      } catch (error) {
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test3400

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_3400

     * @tc.desc   Verify execute(task, configs) resolves a Map return value before timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnMapTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, { timeout: 1000 });
      } catch (error) {
        expect().assertFail();
      }
      let map = result as Map<string, number>;
      expect(map.size).assertEqual(1);
      expect(map.get("key")).assertEqual(1);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test3500

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_3500

     * @tc.desc   Verify execute(task, configs) resolves a Set return value before timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnSetTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, { timeout: 1000 });
      } catch (error) {
        expect().assertFail();
      }
      let set = result as Set<number>;
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test3600

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_3600

     * @tc.desc   Verify AtomicInt counter increments while timed-out task continues executing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(atomicCountTask, counter);
      let rejected: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 1000 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      // 轮询等待超时后任务继续执行并完成计数（固定 800ms 余量会被负载下的 dispatch 延迟吃掉）
      let begin3600: number = Date.now();
      while (counter.load() === 0 && Date.now() - begin3600 < 10000) {
        try {
          await Utils.msSleep(50);
        } catch (error) {
          expect().assertFail();
        }
      }
      expect(counter.load()).assertEqual(1);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test3700

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_3700

     * @tc.desc   Verify AtomicBoolean status flag becomes true after timed-out task finishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let flag: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(atomicFlagTask, flag);
      let rejected: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 1000 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      // 轮询等待超时后任务继续执行并落盘状态标记（固定 1300ms 余量会被负载下的 dispatch 延迟吃掉）
      let begin3700: number = Date.now();
      while (flag.load() === 0 && Date.now() - begin3700 < 10000) {
        try {
          await Utils.msSleep(50);
        } catch (error) {
          expect().assertFail();
        }
      }
      expect(flag.load()).assertEqual(1);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test3800

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_3800

     * @tc.desc   Verify execute(task, configs) rejects when task returns a rejected Promise before timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(rejectPromiseTask);
      let rejected: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 1000 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test3900

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_3900

     * @tc.desc   Verify Promise.all rejects when one of three tasks times out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(longTask, 500.0);
      let task2: taskpool.Task = new taskpool.Task(longTask, 5000.0);
      let task3: taskpool.Task = new taskpool.Task(longTask, 500.0);
      let p1 = taskpool.execute(task1, { timeout: 1000 });
      let p2 = taskpool.execute(task2, { timeout: 1000 });
      let p3 = taskpool.execute(task3, { timeout: 1000 });
      let rejected: boolean = false;
      try {
        await Promise.all([p1, p2, p3]);
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test4000

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_4000

     * @tc.desc   Verify execute(task, configs) at equal timeout boundary (1000ms task, timeout=1000) settles with valid outcome
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longTask, 1000.0);
      let ok: boolean = false;
      let timedOut: boolean = false;
      let r: string = '';
      try {
        r = await taskpool.execute(task, { timeout: 1000 }) as string;
        ok = true;
      } catch (error) {
        timedOut = true;
      }
      if (ok) {
        expect(r).assertEqual('success');
      } else {
        expect(timedOut).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test4100

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_4100

     * @tc.desc   Verify onStartExecution callback triggers for a task that completes before timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let started: boolean = false;
      let task: taskpool.Task = new taskpool.Task(longTask, 500.0);
      let cbStart0: () => void = (): void => {        started = true;}
      task.onStartExecution(cbStart0);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, { timeout: 1000 });
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual('success');
      expect(started).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test4200

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_4200

     * @tc.desc   Verify task using internal setTimeout delay resolves within timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(timerDelayTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, { timeout: 1500 });
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual('timed');
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test4300

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_4300

     * @tc.desc   Verify nested async operation inside task times out when exceeding timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(nestedAsyncTask);
      let rejected: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 1000 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test4400

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_4400

     * @tc.desc   Verify Promise chain inside task times out when exceeding timeout (adapted from Promise-chain per ArkTS await style)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(promiseChainTask);
      let rejected: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 1000 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test4500

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_4500

     * @tc.desc   Verify Task.isCanceled returns false while timed-out task continues executing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let flag: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(isCanceledCheckTask, flag);
      let rejected: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 1000 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      try {
        await Utils.msSleep(1300);
      } catch (error) {
        expect().assertFail();
      }
      expect(flag.load()).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test4600

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_4600

     * @tc.desc   Verify 999ms task with timeout=1000 settles with valid outcome at boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longTask, 999.0);
      let ok: boolean = false;
      let timedOut: boolean = false;
      let r: string = '';
      try {
        r = await taskpool.execute(task, { timeout: 1000 }) as string;
        ok = true;
      } catch (error) {
        timedOut = true;
      }
      if (ok) {
        expect(r).assertEqual('success');
      } else {
        expect(timedOut).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test4700

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_4700

     * @tc.desc   Verify 1001ms task with timeout=1000 settles with valid outcome at boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longTask, 1001.0);
      let ok: boolean = false;
      let timedOut: boolean = false;
      let r: string = '';
      try {
        r = await taskpool.execute(task, { timeout: 1000 }) as string;
        ok = true;
      } catch (error) {
        timedOut = true;
      }
      if (ok) {
        expect(r).assertEqual('success');
      } else {
        expect(timedOut).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test4800

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_4800

     * @tc.desc   Verify LongTask timeout rejection then terminateTask after completion does not throw (terminateTask is post-completion thread reclaim per SDK doc)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let longT: taskpool.LongTask = new taskpool.LongTask(longTask, 5000.0);
      let rejected: boolean = false;
      try {
        await taskpool.execute(longT, { timeout: 1000 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      let terminateOk: boolean = true;
      try {
        taskpool.terminateTask(longT);
      } catch (error) {
        terminateOk = false;
      }
      expect(terminateOk).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test4900

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_4900

     * @tc.desc   Verify LongTask rejected on timeout and terminateTask after timeout has no impact
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let longT: taskpool.LongTask = new taskpool.LongTask(longTask, 7500.0);
      let rejected: boolean = false;
      try {
        await taskpool.execute(longT, { timeout: 1500 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      let terminateOk: boolean = true;
      try {
        taskpool.terminateTask(longT);
      } catch (error) {
        terminateOk = false;
      }
      expect(terminateOk).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test5000

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_5000

     * @tc.desc   Verify task throwing after timeout rejects execute(task, configs)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(slowThrowTask);
      let rejected: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 1000 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test5100

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_5100

     * @tc.desc   Verify exception thrown in async continuation is caught after execute resolves (adapted from then-callback throw per ArkTS await style)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, { timeout: 1000 });
      } catch (error) {
        expect().assertFail();
      }
      let caught: boolean = false;
      let continuation: () => Promise<void> = async (): Promise<void> => {
        throw new Error("callback throw");
      };
      try {
        await continuation();
      } catch (error) {
        caught = true;
      }
      expect(result as string).assertEqual('result');
      expect(caught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test5200

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_5200

     * @tc.desc   Verify single-layer 10000 loop task completes within timeout and returns count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(loopCountTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, { timeout: 5000 });
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(10000);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test5300

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_5300

     * @tc.desc   Verify nested 100x100 loop task completes within timeout and returns count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(nestedLoopTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, { timeout: 5000 });
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(10000);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test5400

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_5400

     * @tc.desc   Verify single-layer 1000000 loop task rejects when exceeding 100ms timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute3Test5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(heavyLoopTask);
      let rejected: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 100 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test5500

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_5500

     * @tc.desc   Verify 100M data transfer task completes within timeout with intact data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(bigDataTask);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, { timeout: 10000 });
      } catch (error) {
        expect().assertFail();
      }
      let arr = result as Uint8Array;
      expect(arr.length).assertEqual(100 * 1024 * 1024);
      expect(arr[0]).assertEqual(1);
      expect(arr[arr.length - 1]).assertEqual(2);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test5600

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_5600

     * @tc.desc   Verify 100M data transfer task rejects when exceeding 1000ms timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(bigDataTimeoutTask);
      let rejected: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 1000 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test5700

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_5700

     * @tc.desc   Verify IP-002 step1: transaction state marker created with initial value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let txState: CounterObj = new CounterObj(0);
      expect(txState.count).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test5800

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_5800

     * @tc.desc   Verify IP-002 step2: 8000ms db query task function rejects with 5000ms timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(dbQueryTask);
      let rejected: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 5000 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test5900

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_5900

     * @tc.desc   Verify IP-002 step4: catch updates transaction state to -1 on timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let txState: CounterObj = new CounterObj(0);
      let task: taskpool.Task = new taskpool.Task(dbQueryTask);
      let rejected: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 5000 });
      } catch (error) {
        rejected = true;
        txState.count = -1;
      }
      expect(rejected).assertTrue();
      expect(txState.count).assertEqual(-1);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test6000

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_6000

     * @tc.desc   Verify IP-002 step5: awaiting timed-out db query rejects and transaction state is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let txState: CounterObj = new CounterObj(0);
      let task: taskpool.Task = new taskpool.Task(dbQueryTask);
      let rejected: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 5000 });
      } catch (error) {
        rejected = true;
        txState.count = -1;
      }
      expect(rejected).assertTrue();
      expect(txState.count).assertEqual(-1);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test6100

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_6100

     * @tc.desc   Verify IP-002 step6: rollback function invoked when transaction state is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let txState: CounterObj = new CounterObj(0);
      let task: taskpool.Task = new taskpool.Task(dbQueryTask);
      let rejected: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 5000 });
      } catch (error) {
        rejected = true;
        txState.count = -1;
      }
      expect(rejected).assertTrue();
      expect(txState.count).assertEqual(-1);
      let rollbackInvoked: boolean = false;
      if (txState.count === -1) {
        let rollbackResult: string = rollbackDbTransaction();
        rollbackInvoked = (rollbackResult === 'rolled-back');
      }
      expect(rollbackInvoked).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test6200

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_6200

     * @tc.desc   Verify IP-003 step1: retry counter created with initial value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let retryCounter: CounterObj = new CounterObj(0);
      expect(retryCounter.count).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test6300

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_6300

     * @tc.desc   Verify IP-003 step2: 3000ms weak network task rejects with 2000ms timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(weakNetworkTask);
      let rejected: boolean = false;
      try {
        await taskpool.execute(task, { timeout: 2000 });
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test6400

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_6400

     * @tc.desc   Verify IP-003 step3: retry loop retries 3 times and enters degraded state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let retryCounter: CounterObj = new CounterObj(0);
      let degradedFlag: CounterObj = new CounterObj(0);
      try {
        await networkRetryLoop(3, retryCounter, degradedFlag);
      } catch (error) {
        expect().assertFail();
      }
      expect(retryCounter.count).assertEqual(3);
      expect(degradedFlag.count).assertEqual(1);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test6500

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_6500

     * @tc.desc   Verify IP-003 step4: retry counter increments once after first timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let retryCounter: CounterObj = new CounterObj(0);
      let degradedFlag: CounterObj = new CounterObj(0);
      try {
        await networkRetryLoop(1, retryCounter, degradedFlag);
      } catch (error) {
        expect().assertFail();
      }
      expect(retryCounter.count).assertEqual(1);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test6600

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_6600

     * @tc.desc   Verify IP-003 step5: retry counter reaches 2 after second timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let retryCounter: CounterObj = new CounterObj(0);
      let degradedFlag: CounterObj = new CounterObj(0);
      try {
        await networkRetryLoop(2, retryCounter, degradedFlag);
      } catch (error) {
        expect().assertFail();
      }
      expect(retryCounter.count).assertEqual(2);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute3Test6700

     * @tc.number SUB_TASKPOOL_EXECUTE3_TEST_6700

     * @tc.desc   Verify IP-003 step6: retry counter reaches 3 after third timeout and degraded logic executes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute3Test6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let retryCounter: CounterObj = new CounterObj(0);
      let degradedFlag: CounterObj = new CounterObj(0);
      try {
        await networkRetryLoop(3, retryCounter, degradedFlag);
      } catch (error) {
        expect().assertFail();
      }
      expect(retryCounter.count).assertEqual(3);
      expect(degradedFlag.count).assertEqual(1);
      done();
    })
  })
}
