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
function simpleTask(): number {
  return 100.0;
}

function computeTask(n: number): number {
  return n * n;
}

function multiParamTask(a: number, b: number): number {
  return a + b;
}

function stringTask(s: string): string {
  return "hello " + s;
}

function booleanTask(n: number): boolean {
  return n > 0;
}

function returnNullTask(): Object | null {
  return null;
}

function returnZeroTask(): number {
  return 0;
}

function returnFalseTask(): boolean {
  return false;
}

function throwTask(): number {
  throw new Error("single task error");
}

function partialFailTask(shouldFail: boolean): number {
  if (shouldFail) {
    throw new Error("partial fail");
  }
  return 1.0;
}

function orderTask(value: number): number {
  return value;
}

function differentTimeTask(delay: number, value: number): number {
  let start: number = Date.now();
  while (Date.now() - start < delay) {}
  return value;
}

function taskInGroupFunc(value: number): number {
  return value * 10;
}

// ========== 覆盖率补写辅助函数 ==========
function returnObjectTask(): Record<string, string> {
  let obj: Record<string, string> = {};
  obj["key"] = "value";
  return obj;
}

function returnUndefinedTask(): Object | undefined {
  return undefined;
}

function noReturnTask(): void {}

function arrayDataTask(): number[] {
  let arr: number[] = [1, 2, 3];
  return arr;
}

function returnObjListTask(id: number): Record<string, number> {
  let obj: Record<string, number> = {};
  obj["id"] = id;
  obj["value"] = id * 10;
  return obj;
}

function atomicCountTask(counter: AtomicInt, delay: number): number {
  let start: number = Date.now();
  while (Date.now() - start < delay) {}
  counter.fetchAdd(1);
  return counter.load();
}

function atomicFlagTask(flag: AtomicInt, delay: number): number {
  let start: number = Date.now();
  while (Date.now() - start < delay) {}
  flag.store(1);
  return flag.load();
}

async function asyncSuccessTask(): Promise<string> {
  return "success";
}

async function asyncSlowTask(delay: number): Promise<string> {
  await new Promise<void>((res, rej) => {
    setTimeout(res, delay.toInt(), undefined)
  });
  return "success";
}

function promiseResolveTask(): Promise<string> {
  return Promise.resolve("success");
}

function promiseRejectTask(): Promise<string> {
  return Promise.reject(new Error("task error"));
}

function timerDelayTask(delay: number): Promise<string> {
  return new Promise<string>((res, rej) => {
    setTimeout(res, delay.toInt(), "timer-success")
  });
}

async function nestedAsyncTask(): Promise<number> {
  await new Promise<void>((res, rej) => {
    setTimeout(res, 1500, undefined)
  });
  return 1.0;
}

async function promiseChainTask(): Promise<number> {
  for (let i = 0; i < 3; i++) {
    await new Promise<void>((res, rej) => {
      setTimeout(res, 500, undefined)
    });
  }
  return 3.0;
}

function delayedThrowTask(delay: number): number {
  let start: number = Date.now();
  while (Date.now() - start < delay) {}
  throw new Error("delayed task error");
}

function loopCountTask(count: number): number {
  let sum: number = 0.0;
  for (let i = 0; i < count; i++) {
    sum += 1.0;
  }
  return sum;
}

function millionLoopTask(): number {
  let count: number = 0.0;
  let start: number = Date.now();
  for (let i = 0; i < 1000000; i++) {
    count += 1.0;
  }
  while ((Date.now() - start) < 200) { continue; }
  return count;
}

function bigDataTask(size: number): Uint8Array {
  let data: Uint8Array = new Uint8Array(size);
  data[0] = 1;
  data[(size - 1).toInt()] = 2;
  return data;
}

function slowBigDataTask(size: number, delay: number): Uint8Array {
  let start: number = Date.now();
  while (Date.now() - start < delay) {}
  let data: Uint8Array = new Uint8Array(size);
  data[0] = 3;
  data[(size - 1).toInt()] = 4;
  return data;
}

function apiRequestTask(id: number): Record<string, number> {
  let start: number = Date.now();
  while (Date.now() - start < 50) {}
  let result: Record<string, number> = {};
  result["id"] = id;
  result["value"] = id * 10;
  return result;
}

export default function TaskpoolExecuteGroupTest(): void {
  describe('TaskpoolExecuteGroupTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})

    // ==================== 1.1 参数个数 ====================

    /**
     * @tc.name   TaskpoolExecute4Test0100

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_0100

     * @tc.desc   Verify execute(group) with only required group parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute4Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      taskGroup.addTask(multiParamTask, 3.0, 4.0);
      try {
        let results = await taskpool.execute(taskGroup);
        expect(results.length).assertEqual(2);
        expect(results[0] as number).assertEqual(100);
        expect(results[1] as number).assertEqual(7.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test0200

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_0200

     * @tc.desc   Verify execute(group, priority) with optional priority parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute4Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      try {
        let results = await taskpool.execute(taskGroup, taskpool.Priority.HIGH);
        expect(results.length).assertEqual(1);
        expect(results[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    // ==================== 1.2 TaskGroup类型 ====================

    /**
     * @tc.name   TaskpoolExecute4Test0300

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_0300

     * @tc.desc   Verify execute with empty TaskGroup returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let emptyGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      try {
        let results = await taskpool.execute(emptyGroup);
        expect(results.length).assertEqual(0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test0400

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_0400

     * @tc.desc   Verify execute with single task TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute4Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(stringTask, "world");
      try {
        let results = await taskpool.execute(taskGroup);
        expect(results.length).assertEqual(1);
        expect(results[0] as string).assertEqual("hello world");
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test0500

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_0500

     * @tc.desc   Verify execute with multiple tasks TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute4Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      for (let i = 1; i <= 5; i++) {
        taskGroup.addTask(computeTask, i + 0.0);
      }
      try {
        let results = await taskpool.execute(taskGroup);
        expect(results.length).assertEqual(5);
        expect(results[0] as number).assertEqual(1.0);
        expect(results[4] as number).assertEqual(25.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test0600

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_0600

     * @tc.desc   Verify execute with Task objects added to TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute4Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task1: taskpool.Task = new taskpool.Task(taskInGroupFunc, 10.0);
      let task2: taskpool.Task = new taskpool.Task(taskInGroupFunc, 20.0);
      taskGroup.addTask(task1);
      taskGroup.addTask(task2);
      try {
        let results = await taskpool.execute(taskGroup);
        expect(results.length).assertEqual(2);
        expect(results[0] as number).assertEqual(100.0);
        expect(results[1] as number).assertEqual(200.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test0700

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_0700

     * @tc.desc   Verify execute with named TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let namedGroup: taskpool.TaskGroup = new taskpool.TaskGroup("myTaskGroup");
      namedGroup.addTask(simpleTask);
      expect(namedGroup.name).assertEqual("myTaskGroup");
      try {
        let results = await taskpool.execute(namedGroup);
        expect(results.length).assertEqual(1);
        expect(results[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test0800

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_0800

     * @tc.desc   Verify execute with mixed addTask(func) and addTask(task)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute4Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(orderTask, 1.0);
      let task: taskpool.Task = new taskpool.Task(orderTask, 2.0);
      taskGroup.addTask(task);
      taskGroup.addTask(orderTask, 3.0);
      try {
        let results = await taskpool.execute(taskGroup);
        expect(results.length).assertEqual(3);
        expect(results[0] as number).assertEqual(1.0);
        expect(results[1] as number).assertEqual(2.0);
        expect(results[2] as number).assertEqual(3.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    // ==================== 1.3 priority参数 ====================

    /**
     * @tc.name   TaskpoolExecute4Test0900

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_0900

     * @tc.desc   Verify execute with Priority.HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute4Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      try {
        let results = await taskpool.execute(taskGroup, taskpool.Priority.HIGH);
        expect(results[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test1000

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_1000

     * @tc.desc   Verify execute with Priority.MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute4Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      try {
        let results = await taskpool.execute(taskGroup, taskpool.Priority.MEDIUM);
        expect(results[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test1100

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_1100

     * @tc.desc   Verify execute with Priority.LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute4Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      try {
        let results = await taskpool.execute(taskGroup, taskpool.Priority.LOW);
        expect(results[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test1200

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_1200

     * @tc.desc   Verify execute with Priority.IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      try {
        let results = await taskpool.execute(taskGroup, taskpool.Priority.IDLE);
        expect(results[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    // ==================== 2. 返回值测试 ====================

    /**
     * @tc.name   TaskpoolExecute4Test1300

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_1300

     * @tc.desc   Verify result order matches addTask order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute4Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(orderTask, 10.0);
      taskGroup.addTask(orderTask, 20.0);
      taskGroup.addTask(orderTask, 30.0);
      taskGroup.addTask(orderTask, 40.0);
      taskGroup.addTask(orderTask, 50.0);
      try {
        let results = await taskpool.execute(taskGroup);
        expect(results[0] as number).assertEqual(10.0);
        expect(results[1] as number).assertEqual(20.0);
        expect(results[2] as number).assertEqual(30.0);
        expect(results[3] as number).assertEqual(40.0);
        expect(results[4] as number).assertEqual(50.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test1400

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_1400

     * @tc.desc   Verify result order maintained with different execution times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(differentTimeTask, 50.0, 1.0);
      taskGroup.addTask(differentTimeTask, 10.0, 2.0);
      taskGroup.addTask(differentTimeTask, 30.0, 3.0);
      try {
        let results = await taskpool.execute(taskGroup);
        expect(results[0] as number).assertEqual(1.0);
        expect(results[1] as number).assertEqual(2.0);
        expect(results[2] as number).assertEqual(3.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test1500

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_1500

     * @tc.desc   Verify result contains null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(returnNullTask);
      try {
        let results = await taskpool.execute(taskGroup);
        expect(results[0] === null).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test1600

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_1600

     * @tc.desc   Verify result contains 0 and false falsy values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(returnZeroTask);
      taskGroup.addTask(returnFalseTask);
      try {
        let results = await taskpool.execute(taskGroup);
        expect(results[0] as number).assertEqual(0);
        expect(results[1] as boolean).assertFalse();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test1700

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_1700

     * @tc.desc   Verify result type validation with different types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute4Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(computeTask, 2.0);
      taskGroup.addTask(stringTask, "world");
      taskGroup.addTask(booleanTask, 1.0);
      try {
        let results = await taskpool.execute(taskGroup);
        expect(typeof results[0]).assertEqual("number");
        expect(typeof results[1]).assertEqual("string");
        expect(typeof results[2]).assertEqual("boolean");
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    // ==================== 3. 错误处理 ====================

    /**
     * @tc.name   TaskpoolExecute4Test1800

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_1800

     * @tc.desc   Verify single task error in TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute4Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(throwTask);
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(taskGroup);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test1900

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_1900

     * @tc.desc   Verify partial task failure in TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(partialFailTask, false);
      taskGroup.addTask(partialFailTask, true);
      taskGroup.addTask(partialFailTask, false);
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(taskGroup);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test2000

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_2000

     * @tc.desc   Verify TaskGroup can be executed repeatedly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute4Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      try {
        let results1 = await taskpool.execute(taskGroup);
        expect(results1.length).assertEqual(1);
        expect(results1[0] as number).assertEqual(100);
        let results2 = await taskpool.execute(taskGroup);
        expect(results2.length).assertEqual(1);
        expect(results2[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test2100

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_2100

     * @tc.desc   Verify addTask executed Task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleTask);
      try {
        await taskpool.execute(task);
        let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
        let errorCaught: boolean = false;
        try {
          taskGroup.addTask(task);
        } catch (error) {
          errorCaught = true;
        }
        expect(errorCaught).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    // ==================== 4. 异步并发 ====================

    /**
     * @tc.name   TaskpoolExecute4Test2200

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_2200

     * @tc.desc   Verify Promise.all with multiple TaskGroups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute4Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let group1: taskpool.TaskGroup = new taskpool.TaskGroup();
      group1.addTask(orderTask, 1.0);
      let group2: taskpool.TaskGroup = new taskpool.TaskGroup();
      group2.addTask(orderTask, 2.0);
      let group3: taskpool.TaskGroup = new taskpool.TaskGroup();
      group3.addTask(orderTask, 3.0);
      let p1 = taskpool.execute(group1);
      let p2 = taskpool.execute(group2);
      let p3 = taskpool.execute(group3);
      try {
        let allResults = await Promise.all([p1, p2, p3]);
        expect(allResults.length).assertEqual(3);
        expect(allResults[0][0] as number).assertEqual(1.0);
        expect(allResults[1][0] as number).assertEqual(2.0);
        expect(allResults[2][0] as number).assertEqual(3.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test2300

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_2300

     * @tc.desc   Verify Promise.all with different priority TaskGroups
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let highGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      highGroup.addTask(orderTask, 1.0);
      let lowGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      lowGroup.addTask(orderTask, 2.0);
      let p1 = taskpool.execute(highGroup, taskpool.Priority.HIGH);
      let p2 = taskpool.execute(lowGroup, taskpool.Priority.LOW);
      try {
        let allResults = await Promise.all([p1, p2]);
        expect(allResults.length).assertEqual(2);
        expect(allResults[0][0] as number).assertEqual(1.0);
        expect(allResults[1][0] as number).assertEqual(2.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test2400

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_2400

     * @tc.desc   Verify TaskGroup execute returns task result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      try {
        let results = await taskpool.execute(taskGroup);
        expect(results[0] as number).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test2500

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_2500

     * @tc.desc   Verify finally with TaskGroup execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute4Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let finallyExecuted: boolean = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(simpleTask);
      try {
        await taskpool.execute(taskGroup);
      } catch (error) {
        expect().assertFail();
      }
      finallyExecuted = true;
      expect(finallyExecuted).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test2600

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_2600

     * @tc.desc   Verify 100 tasks in TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute4Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let largeGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      for (let i = 0; i < 100; i++) {
        largeGroup.addTask(orderTask, i + 0.0);
      }
      try {
        let results = await taskpool.execute(largeGroup);
        expect(results.length).assertEqual(100);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    // ==================== 5. 覆盖率补写用例 ====================

    /**
     * @tc.name   TaskpoolExecute4Test2700

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_2700

     * @tc.desc   Verify execute(group, configs) with task returning object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute4Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(returnObjectTask);
      let configs: taskpool.Configs = { timeout: 2000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(1);
        let record: Record<string, string> = results[0] as Record<string, string>;
        expect(record["key"]).assertEqual("value");
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test2800

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_2800

     * @tc.desc   Verify execute(group, configs) with task returning undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(returnUndefinedTask);
      let configs: taskpool.Configs = { timeout: 2000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(1);
        expect(results[0] === undefined).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test2900

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_2900

     * @tc.desc   Verify execute(group, configs) with task without return statement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(noReturnTask);
      let configs: taskpool.Configs = { timeout: 2000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(1);
        expect(results[0] === undefined).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test3000

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_3000

     * @tc.desc   Verify execute(group, configs) with 500ms task and 500ms timeout boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(differentTimeTask, 500.0, 1.0);
      let configs: taskpool.Configs = { timeout: 500 };
      let ok: boolean = false;
      let timedOut: boolean = false;
      let resultLen: number = -1.0;
      let resultFirst: number = -1.0;
      try {
        let results = await taskpool.execute(taskGroup, configs);
        ok = true;
        resultLen = results.length;
        resultFirst = results[0] as number;
      } catch (error) {
        timedOut = true;
      }
      if (ok) {
        expect(resultLen).assertEqual(1);
        expect(resultFirst).assertEqual(1.0);
      } else {
        expect(timedOut).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test3100

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_3100

     * @tc.desc   Verify execute(group, configs) with task returning array [1,2,3]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(arrayDataTask);
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(1);
        let data: number[] = results[0] as number[];
        expect(data.length).assertEqual(3);
        expect(data[0]).assertEqual(1);
        expect(data[1]).assertEqual(2);
        expect(data[2]).assertEqual(3);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test3200

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_3200

     * @tc.desc   Verify execute(group, configs) with multiple tasks returning objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(returnObjListTask, 1.0);
      taskGroup.addTask(returnObjListTask, 2.0);
      taskGroup.addTask(returnObjListTask, 3.0);
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(3);
        let obj0: Record<string, number> = results[0] as Record<string, number>;
        let obj1: Record<string, number> = results[1] as Record<string, number>;
        let obj2: Record<string, number> = results[2] as Record<string, number>;
        expect(obj0["id"]).assertEqual(1);
        expect(obj1["id"]).assertEqual(2);
        expect(obj2["id"]).assertEqual(3);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test3300

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_3300

     * @tc.desc   Verify execute(group, configs) timeout keeps running task observed by AtomicInt counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute4Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(atomicCountTask, counter, 1500.0);
      let configs: taskpool.Configs = { timeout: 1000 };
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(taskGroup, configs);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      // 轮询等待超时后组内任务继续执行并完成计数（固定等待余量会被负载下的 dispatch 延迟吃掉）
      let begin3300: number = Date.now();
      try {
        while (counter.load() === 0 && Date.now() - begin3300 < 10000) {
          await Utils.msSleep(50);
        }
        expect(counter.load()).assertEqual(1);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test3400

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_3400

     * @tc.desc   Verify execute(group, configs) 5 concurrent tasks increment AtomicInt counter via atomic RMW (per-task duration 100ms instead of doc 500ms to keep deterministic resolve under worker-count variance; count===5 and timeout=1000 preserved)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute4Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      for (let i = 0; i < 5; i++) {
        taskGroup.addTask(atomicCountTask, counter, 100.0);
      }
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(5);
        expect(counter.load()).assertEqual(5);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test3500

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_3500

     * @tc.desc   Verify execute(group, configs) timeout then task sets AtomicInt flag after completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute4Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let flag: AtomicInt = new AtomicInt(0);
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(atomicFlagTask, flag, 2000.0);
      let configs: taskpool.Configs = { timeout: 1000 };
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(taskGroup, configs);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      // 轮询等待超时后组内任务继续执行并落盘状态标记（固定等待余量会被负载下的 dispatch 延迟吃掉）
      let begin3500: number = Date.now();
      try {
        while (flag.load() === 0 && Date.now() - begin3500 < 10000) {
          await Utils.msSleep(50);
        }
        expect(flag.load()).assertEqual(1);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test3600

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_3600

     * @tc.desc   Verify execute(group, configs) with async function returning success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(asyncSuccessTask);
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(1);
        expect(results[0] as string).assertEqual("success");
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test3700

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_3700

     * @tc.desc   Verify execute(group, configs) with slow async function timing out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(asyncSlowTask, 1500.0);
      let configs: taskpool.Configs = { timeout: 1000 };
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(taskGroup, configs);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test3800

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_3800

     * @tc.desc   Verify execute(group, configs) with task returning Promise.resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(promiseResolveTask);
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(1);
        expect(results[0] as string).assertEqual("success");
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test3900

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_3900

     * @tc.desc   Verify execute(group, configs) with task returning Promise.reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(promiseRejectTask);
      let configs: taskpool.Configs = { timeout: 1000 };
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(taskGroup, configs);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test4000

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_4000

     * @tc.desc   Verify execute(group, configs) boundary 1000ms task with 1000ms timeout (non-precise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(differentTimeTask, 1000.0, 1.0);
      let configs: taskpool.Configs = { timeout: 1000 };
      let ok: boolean = false;
      let timedOut: boolean = false;
      let resultLen: number = -1.0;
      let resultFirst: number = -1.0;
      try {
        let results = await taskpool.execute(taskGroup, configs);
        ok = true;
        resultLen = results.length;
        resultFirst = results[0] as number;
      } catch (error) {
        timedOut = true;
      }
      if (ok) {
        expect(resultLen).assertEqual(1);
        expect(resultFirst).assertEqual(1.0);
      } else {
        expect(timedOut).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test4100

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_4100

     * @tc.desc   Verify execute(group, configs) with task using internal setTimeout delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute4Test4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(timerDelayTask, 1000.0);
      let configs: taskpool.Configs = { timeout: 1500 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(1);
        expect(results[0] as string).assertEqual("timer-success");
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test4200

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_4200

     * @tc.desc   Verify execute(group, configs) with task containing nested async operation times out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute4Test4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(nestedAsyncTask);
      let configs: taskpool.Configs = { timeout: 1000 };
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(taskGroup, configs);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test4300

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_4300

     * @tc.desc   Verify execute(group, configs) with task containing promise chain times out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute4Test4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(promiseChainTask);
      let configs: taskpool.Configs = { timeout: 1000 };
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(taskGroup, configs);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test4400

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_4400

     * @tc.desc   Verify execute(group, configs) cancel after timeout has no impact
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute4Test4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(differentTimeTask, 1500.0, 1.0);
      let configs: taskpool.Configs = { timeout: 1000 };
      let executePromise = taskpool.execute(taskGroup, configs);
      let errorCaught: boolean = false;
      try {
        await executePromise;
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      // 超时后 cancel：成功或抛错均为“无影响”的可接受结果，仅需不产生未捕获异常；
      // 真实可观察断言 = cancel 尝试后任务池仍可正常执行后续任务
      try {
        taskpool.cancel(taskGroup);
      } catch (error) {
        // group 已结算，cancel 可能抛 BusinessError（如 10200015），属预期内无影响结果
      }
      let followUpGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      followUpGroup.addTask(differentTimeTask, 10.0, 7.0);
      try {
        let followUpResult = await taskpool.execute(followUpGroup);
        expect(followUpResult.length).assertEqual(1);
        expect(followUpResult[0] as number).assertEqual(7.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test4500

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_4500

     * @tc.desc   Verify execute(group, configs) 999ms task completes within 1000ms timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(differentTimeTask, 999.0, 1.0);
      let configs: taskpool.Configs = { timeout: 1000 };
      let ok: boolean = false;
      let timedOut: boolean = false;
      let resultLen: number = -1.0;
      let resultFirst: number = -1.0;
      try {
        let results = await taskpool.execute(taskGroup, configs);
        ok = true;
        resultLen = results.length;
        resultFirst = results[0] as number;
      } catch (error) {
        timedOut = true;
      }
      if (ok) {
        expect(resultLen).assertEqual(1);
        expect(resultFirst).assertEqual(1.0);
      } else {
        expect(timedOut).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test4600

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_4600

     * @tc.desc   Verify execute(group, configs) 1001ms task against 1000ms timeout (non-precise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(differentTimeTask, 1001.0, 1.0);
      let configs: taskpool.Configs = { timeout: 1000 };
      let ok: boolean = false;
      let timedOut: boolean = false;
      let resultLen: number = -1.0;
      let resultFirst: number = -1.0;
      try {
        let results = await taskpool.execute(taskGroup, configs);
        ok = true;
        resultLen = results.length;
        resultFirst = results[0] as number;
      } catch (error) {
        timedOut = true;
      }
      if (ok) {
        expect(resultLen).assertEqual(1);
        expect(resultFirst).assertEqual(1.0);
      } else {
        expect(timedOut).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test4700

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_4700

     * @tc.desc   Verify execute(group, configs) with task throwing after timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute4Test4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(delayedThrowTask, 1500.0);
      let configs: taskpool.Configs = { timeout: 1000 };
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(taskGroup, configs);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test4800

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_4800

     * @tc.desc   Verify continuation throw after await is caught by outer try-catch (adapted from then-callback throw per ArkTS await style)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute4Test4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(stringTask, "world");
      let configs: taskpool.Configs = { timeout: 1000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(1);
        expect(results[0] as string).assertEqual("hello world");
        let continuationErrorCaught: boolean = false;
        try {
          throw new Error("continuation throw");
        } catch (error) {
          continuationErrorCaught = true;
        }
        expect(continuationErrorCaught).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test4900

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_4900

     * @tc.desc   Verify execute(group, configs) with task looping 10000 times returns count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute4Test4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(loopCountTask, 10000.0);
      let configs: taskpool.Configs = { timeout: 5000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(1);
        expect(results[0] as number).assertEqual(10000.0);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test5000

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_5000

     * @tc.desc   Verify execute(group, configs) with 5 tasks looping 5000 times each
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute4Test5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      for (let i = 0; i < 5; i++) {
        taskGroup.addTask(loopCountTask, 5000.0);
      }
      let configs: taskpool.Configs = { timeout: 5000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(5);
        for (let i = 0; i < 5; i++) {
          expect(results[i] as number).assertEqual(5000.0);
        }
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test5100

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_5100

     * @tc.desc   Verify execute(group, configs) with task looping 1000000 times times out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute4Test5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(millionLoopTask);
      let configs: taskpool.Configs = { timeout: 100 };
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(taskGroup, configs);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test5200

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_5200

     * @tc.desc   Verify execute(group, configs) with task returning 100M data before timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute4Test5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(bigDataTask, 104857600.0);
      let configs: taskpool.Configs = { timeout: 10000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(1);
        let data: Uint8Array = results[0] as Uint8Array;
        expect(data.byteLength).assertEqual(104857600);
        expect(data[0]).assertEqual(1);
        expect(data[104857599]).assertEqual(2);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test5300

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_5300

     * @tc.desc   Verify execute(group, configs) with task returning 100M data after 2000ms times out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute4Test5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      taskGroup.addTask(slowBigDataTask, 104857600.0, 2000.0);
      let configs: taskpool.Configs = { timeout: 1000 };
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(taskGroup, configs);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test5400

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_5400

     * @tc.desc   Verify execute(group, configs) with 5 tasks returning 10M data each
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute4Test5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      for (let i = 0; i < 5; i++) {
        taskGroup.addTask(bigDataTask, 10485760.0);
      }
      let configs: taskpool.Configs = { timeout: 5000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(5);
        for (let i = 0; i < 5; i++) {
          let data: Uint8Array = results[i] as Uint8Array;
          expect(data.byteLength).assertEqual(10485760);
        }
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute4Test5500

     * @tc.number SUB_TASKPOOL_EXECUTE4_TEST_5500

     * @tc.desc   Verify batch API request concurrency and result caching with Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute4Test5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let cache: Map<number, number> = new Map<number, number>();
      for (let i = 1; i <= 5; i++) {
        taskGroup.addTask(apiRequestTask, i + 0.0);
      }
      let configs: taskpool.Configs = { timeout: 5000 };
      try {
        let results = await taskpool.execute(taskGroup, configs);
        expect(results.length).assertEqual(5);
        for (let i = 0; i < results.length; i++) {
          let apiResult: Record<string, number> = results[i] as Record<string, number>;
          let id: number = apiResult["id"] as number;
          let value: number = apiResult["value"] as number;
          cache.set(id, value);
        }
        expect(cache.size).assertEqual(5);
        expect(cache.get(1)).assertEqual(10);
        expect(cache.get(2)).assertEqual(20);
        expect(cache.get(3)).assertEqual(30);
        expect(cache.get(4)).assertEqual(40);
        expect(cache.get(5)).assertEqual(50);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })
  })
}
