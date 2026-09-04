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

// ========== 入参-参数个数 辅助函数 ==========
function simpleFunc(): number {
  return 100;
}

function funcWithArgs(a: number, b: number): number {
  return a + b + 0.0;
}

// ========== 入参-task类型 辅助函数 ==========
function namedFunc(): string {
  return "result";
}

function returnNumber(): number {
  return 123.0;
}

function returnString(): string {
  return "hello";
}

function returnObject(): Record<string, number> {
  let obj: Record<string, number> = {};
  obj["key"] = 1;
  obj["num"] = 100;
  return obj;
}

function returnArray(): number[] {
  return [1, 2, 3, 4, 5];
}

// ========== 入参-priority 辅助函数 ==========
function priorityFunc(): number {
  return 100;
}

// ========== 返回值测试 辅助函数 ==========
function returnFunc(): number {
  return 42.0;
}

function returnNull(): Object | null {
  return null;
}

function returnUndefined(): void {}

function returnEmptyString(): string {
  return "";
}

function returnEmptyArray(): number[] {
  return [];
}

function returnEmptyObject(): Record<string, number> {
  let obj: Record<string, number> = {};
  return obj;
}

function returnZero(): number {
  return 0.0;
}

function returnFalse(): boolean {
  return false;
}

function returnMaxValue(): number {
  return Number.MAX_VALUE;
}

function returnMinValue(): number {
  return Number.MIN_VALUE;
}

function returnBigArray(): number[] {
  let arr: number[] = [];
  for (let i = 0; i < 100; i++) {
    arr.push(i);
  }
  return arr;
}

// ========== 错误处理 辅助函数 ==========
function throwErrorFunc(): number {
  throw new Error("task error");
}

function chainFunc(): number {
  return 100.0;
}

// ========== 异步并发 辅助函数 ==========
function taskFunc(n: number): number {
  return n * 10.0;
}

function computeFunc(x: number, y: number): number {
  return x + y + 0.0;
}

function recordOrderFunc(label: string): string {
  return label;
}

function longRunningTask(duration: number): string {
  let t: number = Date.now();
  while (Date.now() - t < duration) {}
  return "completed";
}

export default function TaskpoolExecuteFuncArgTest(): void {
  describe('TaskpoolExecuteFuncArgTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})

    // ==================== 1.1 参数个数 ====================

    /**
     * @tc.name   TaskpoolExecute2Test0100

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_0100

     * @tc.desc   Verify execute(task) with only required task parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test0200

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_0200

     * @tc.desc   Verify execute(task, priority) with optional priority parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, taskpool.Priority.HIGH);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test0300

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_0300

     * @tc.desc   Verify execute(task) returns Promise when no priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    // ==================== 1.2 task参数类型 ====================

    /**
     * @tc.name   TaskpoolExecute2Test0400

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_0400

     * @tc.desc   Verify execute with Task having function arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(funcWithArgs, 10.0, 20.0);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(30.0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test0500

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_0500

     * @tc.desc   Verify execute with named Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task("myTask", namedFunc);
      expect(task.name).assertEqual("myTask");
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("result");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test0600

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_0600

     * @tc.desc   Verify execute with Task returning number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnNumber);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(typeof result).assertEqual("number");
      expect(result as number).assertEqual(123);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test0700

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_0700

     * @tc.desc   Verify execute with Task returning string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnString);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(typeof result).assertEqual("string");
      expect(result as string).assertEqual("hello");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test0800

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_0800

     * @tc.desc   Verify execute with Task returning object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnObject);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let record = result as Record<string, number>;
      expect(record["key"]).assertEqual(1);
      expect(record["num"]).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test0900

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_0900

     * @tc.desc   Verify execute with Task returning array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnArray);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let arr = result as number[];
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      done();
    })

    // ==================== 1.3 priority参数 ====================

    /**
     * @tc.name   TaskpoolExecute2Test1000

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_1000

     * @tc.desc   Verify execute with Priority.HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(priorityFunc);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, taskpool.Priority.HIGH);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test1100

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_1100

     * @tc.desc   Verify execute with Priority.MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(priorityFunc);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, taskpool.Priority.MEDIUM);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test1200

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_1200

     * @tc.desc   Verify execute with Priority.LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(priorityFunc);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, taskpool.Priority.LOW);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test1300

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_1300

     * @tc.desc   Verify execute with Priority.IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute2Test1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(priorityFunc);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task, taskpool.Priority.IDLE);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test1400

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_1400

     * @tc.desc   Verify execute(task) without priority parameter returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(priorityFunc);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test1500

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_1500

     * @tc.desc   Verify different priority does not affect return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(computeFunc, 5.0, 10.0);
      let resultHigh: Any = undefined;
      try {
        resultHigh = await taskpool.execute(task1, taskpool.Priority.HIGH);
      } catch (error) {
        expect().assertFail();
      }
      let task2: taskpool.Task = new taskpool.Task(computeFunc, 5.0, 10.0);
      let resultLow: Any = undefined;
      try {
        resultLow = await taskpool.execute(task2, taskpool.Priority.LOW);
      } catch (error) {
        expect().assertFail();
      }
      expect(resultHigh as number).assertEqual(15.0);
      expect(resultLow as number).assertEqual(15.0);
      done();
    })

    // ==================== 2. 返回值测试-成功场景 ====================

    /**
     * @tc.name   TaskpoolExecute2Test1600

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_1600

     * @tc.desc   Verify execute returns correct Promise result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnFunc);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(42);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test1700

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_1700

     * @tc.desc   Verify execute returns null when Task returns null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute2Test1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnNull);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result === null).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test1800

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_1800

     * @tc.desc   Verify execute returns undefined when Task returns void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute2Test1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnUndefined);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result === undefined).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test1900

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_1900

     * @tc.desc   Verify execute returns empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute2Test1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnEmptyString);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test2000

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_2000

     * @tc.desc   Verify execute returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute2Test2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnEmptyArray);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let arr = result as number[];
      expect(arr.length).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test2100

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_2100

     * @tc.desc   Verify execute returns empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute2Test2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnEmptyObject);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let record = result as Record<string, number>;
      expect(Object.keys(record).length).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test2200

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_2200

     * @tc.desc   Verify execute returns 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute2Test2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnZero);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test2300

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_2300

     * @tc.desc   Verify execute returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute2Test2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnFalse);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as boolean).assertFalse();
      done();
    })

    // ==================== 2.2 边界返回值 ====================

    /**
     * @tc.name   TaskpoolExecute2Test2400

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_2400

     * @tc.desc   Verify execute returns Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute2Test2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnMaxValue);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(Number.MAX_VALUE);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test2500

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_2500

     * @tc.desc   Verify execute returns Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute2Test2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnMinValue);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(Number.MIN_VALUE);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test2600

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_2600

     * @tc.desc   Verify execute returns large array (100 elements)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute2Test2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(returnBigArray);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let arr = result as number[];
      expect(arr.length).assertEqual(100);
      done();
    })

    // ==================== 2.3 Promise状态验证 ====================

    /**
     * @tc.name   TaskpoolExecute2Test2700

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_2700

     * @tc.desc   Verify execute Promise resolved with then callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let thenResult: string = "";
      let task: taskpool.Task = new taskpool.Task(namedFunc);
      let promise = taskpool.execute(task);
      try {
        let value = await promise;
        thenResult = value as string;
      } catch (error) {
        expect().assertFail();
      }
      expect(thenResult).assertEqual("result");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test2800

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_2800

     * @tc.desc   Verify execute Promise rejected when Task throws Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(throwErrorFunc);
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(task);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test2900

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_2900

     * @tc.desc   Verify Promise then chain callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute2Test2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let finalResult: number = 0;
      let task: taskpool.Task = new taskpool.Task(chainFunc);
      let promise = taskpool.execute(task);
      try {
        let value = await promise;
        finalResult = (value as number) * 2;
      } catch (error) {
        expect().assertFail();
      }
      expect(finalResult).assertEqual(200);
      done();
    })

    // ==================== 3. 错误处理 ====================

    /**
     * @tc.name   TaskpoolExecute2Test3000

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_3000

     * @tc.desc   Verify execute same task twice returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc);
      let result1: Any = undefined;
      try {
        result1 = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result1 as number).assertEqual(100.0);
      let result2: Any = undefined;
      try {
        result2 = await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result2 as number).assertEqual(100.0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test3100

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_3100

     * @tc.desc   Verify executed task with dependency cannot execute again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute2Test3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let dependentTask: taskpool.Task = new taskpool.Task(simpleFunc);
      let mainTask: taskpool.Task = new taskpool.Task(simpleFunc);
      mainTask.addDependency(dependentTask);
      try {
        await taskpool.execute(dependentTask);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await taskpool.execute(mainTask);
      } catch (error) {
        expect().assertFail();
      }
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(mainTask);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test3200

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_3200

     * @tc.desc   Verify try-catch-finally with normal execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let finallyExecuted: boolean = false;
      let errorCaught: boolean = false;
      let task: taskpool.Task = new taskpool.Task(simpleFunc);
      try {
        let result = await taskpool.execute(task);
        expect(result as number).assertEqual(100);
      } catch (error) {
        errorCaught = true;
      } finally {
        finallyExecuted = true;
      }
      expect(errorCaught).assertFalse();
      expect(finallyExecuted).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test3300

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_3300

     * @tc.desc   Verify try-catch-finally with task exception, catch and finally both execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let finallyExecuted: boolean = false;
      let caught: boolean = false;
      try {
        await taskpool.execute(throwErrorFunc);
      } catch (error) {
        caught = true;
      } finally {
        finallyExecuted = true;
      }
      expect(caught).assertTrue();
      expect(finallyExecuted).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test3400

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_3400

     * @tc.desc   Verify task internal throw propagates through Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(throwErrorFunc);
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(task);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    // ==================== 4. 异步并发场景 ====================

    /**
     * @tc.name   TaskpoolExecute2Test3500

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_3500

     * @tc.desc   Verify Promise.all with multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecute2Test3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(taskFunc, 1.0);
      let task2: taskpool.Task = new taskpool.Task(taskFunc, 2.0);
      let task3: taskpool.Task = new taskpool.Task(taskFunc, 3.0);
      let p1 = taskpool.execute(task1);
      let p2 = taskpool.execute(task2);
      let p3 = taskpool.execute(task3);
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
     * @tc.name   TaskpoolExecute2Test3600

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_3600

     * @tc.desc   Verify tasks with different priorities all complete with correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute2Test3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let highTask: taskpool.Task = new taskpool.Task(recordOrderFunc, "HIGH");
      let mediumTask: taskpool.Task = new taskpool.Task(recordOrderFunc, "MEDIUM");
      let lowTask: taskpool.Task = new taskpool.Task(recordOrderFunc, "LOW");
      let p1 = taskpool.execute(highTask, taskpool.Priority.HIGH);
      let p2 = taskpool.execute(mediumTask, taskpool.Priority.MEDIUM);
      let p3 = taskpool.execute(lowTask, taskpool.Priority.LOW);
      let results: Any[] = [];
      try {
        results = (await Promise.all([p1, p2, p3])) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(3);
      expect(results[0] as string).assertEqual("HIGH");
      expect(results[1] as string).assertEqual("MEDIUM");
      expect(results[2] as string).assertEqual("LOW");
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test3700

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_3700

     * @tc.desc   Verify cancel during running does not reject execute(task, priority)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute2Test3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // 轮询确认任务 RUNNING 后再等 50ms 取消（固定 50ms 窗口在负载下可能落在启动前导致 reject）；
      // 3000ms 任务保证取消落在运行中段，与 @tc.desc "cancel during running does not reject" 一致
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 3000.0);
      let executePromise = taskpool.execute(task, taskpool.Priority.HIGH);
      let running3700: boolean = false;
      let begin3700: number = Date.now();
      while (!running3700 && Date.now() - begin3700 < 10000) {
        let poolInfo3700: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo();
        for (let taskInfo of poolInfo3700.taskInfos) {
          if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
            running3700 = true;
          }
        }
        if (!running3700) {
          try {
            await Utils.msSleep(20);
          } catch (error) {
            expect().assertFail();
          }
        }
      }
      expect(running3700).assertTrue();
      try {
        await Utils.msSleep(50);
      } catch (error) {
        expect().assertFail();
      }
      try {
        taskpool.cancel(task);
      } catch (error) {
        // cancel may throw
      }
      try {
        let result: string = await executePromise as string;
        expect(result).assertEqual('completed');
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test3800

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_3800

     * @tc.desc   Verify sequential chain execution A->B->C with tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute2Test3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let executionOrder: number[] = [];
      let task1: taskpool.Task = new taskpool.Task((): number => {
        executionOrder.push(1);
        return 100;
      });
      let r1: Any = undefined;
      try {
        r1 = await taskpool.execute(task1);
      } catch (error) {
        expect().assertFail();
      }
      let task2: taskpool.Task = new taskpool.Task((): number => {
        executionOrder.push(2);
        return (r1 as number) + 50;
      });
      let r2: Any = undefined;
      try {
        r2 = await taskpool.execute(task2);
      } catch (error) {
        expect().assertFail();
      }
      let task3: taskpool.Task = new taskpool.Task((): number => {
        executionOrder.push(3);
        return (r2 as number) + 30;
      });
      let r3: Any = undefined;
      try {
        r3 = await taskpool.execute(task3);
      } catch (error) {
        expect().assertFail();
      }
      expect(executionOrder.length).assertEqual(3);
      expect(executionOrder[0]).assertEqual(1);
      expect(executionOrder[1]).assertEqual(2);
      expect(executionOrder[2]).assertEqual(3);
      expect(r3 as number).assertEqual(180);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test3900

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_3900

     * @tc.desc   Verify retry after failure by creating new Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecute2Test3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let attemptCount: number = 0;
      let retryableFunc = (): number => {
        attemptCount++;
        if (attemptCount < 2) {
          throw new Error("first attempt failed");
        }
        return 100;
      };
      let task1: taskpool.Task = new taskpool.Task(retryableFunc);
      let errorCaught: boolean = false;
      try {
        await taskpool.execute(task1);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      let task2: taskpool.Task = new taskpool.Task(retryableFunc);
      let result: Any = undefined;
      try {
        result = await taskpool.execute(task2);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      expect(attemptCount).assertEqual(2);
      done();
    })

    /**
     * @tc.name   TaskpoolExecute2Test4000

     * @tc.number SUB_TASKPOOL_EXECUTE2_TEST_4000

     * @tc.desc   Verify 100 concurrent tasks with different priorities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecute2Test4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let promises: Promise<Object>[] = [];
      for (let i = 0; i < 100; i++) {
        let task: taskpool.Task = new taskpool.Task(simpleFunc);
        let priority: taskpool.Priority = (i % 4 === 0) ? taskpool.Priority.HIGH :
          (i % 4 === 1) ? taskpool.Priority.MEDIUM :
          (i % 4 === 2) ? taskpool.Priority.LOW : taskpool.Priority.IDLE;
        promises.push(taskpool.execute(task, priority) as Promise<Object>);
      }
      let results: Any[] = [];
      try {
        results = (await Promise.all(promises)) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(100);
      done();
    })
  })
}
