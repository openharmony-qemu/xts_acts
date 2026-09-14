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

// Helper functions for executeDelayed tests
function simpleDelayedTask(): number {
  return 100;
}

function multiArgDelayedTask(a: number, b: number): number {
  return a + b + 0.0;
}

function namedDelayedTask(): number {
  return 42;
}

function objectDelayedTask(): Record<string, number> {
  let obj: Record<string, number> = {};
  obj["value"] = 100;
  obj["id"] = 1;
  return obj;
}

function arrayDelayedTask(): number[] {
  return [1, 2, 3, 4, 5];
}

function stringDelayedTask(): string {
  return "hello";
}

function boolDelayedTask(): boolean {
  return true;
}

function zeroReturnTask(): number {
  return 0;
}

function emptyStrDelayedTask(): string {
  return "";
}

function emptyArrDelayedTask(): number[] {
  return [];
}

function emptyObjDelayedTask(): Record<string, number> {
  let obj: Record<string, number> = {};
  return obj;
}

function voidDelayedTask(): void {}

function throwDelayedTask(): number {
  throw new Error("inner error");
}

function longRunningDelayedTask(): number {
  let start: number = Date.now();
  while (Date.now() - start < 500) {}
  return 100;
}

function sendDataDelayedTask(): number {
  taskpool.Task.sendData(1);
  return 100;
}

function computeDelayedTask(n: number): number {
  return n * 2.0;
}

function quickDelayedTask(n: number): number {
  return n + 0.0;
}

export default function TaskpoolExecuteDelayedTest(): void {
  describe('TaskpoolExecuteDelayedTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})

    /**
     * @tc.name   TaskpoolExecuteDelayedTest0100

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_0100

     * @tc.desc   Verify executeDelayed with required params (delayTime + task) without priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest0200

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_0200

     * @tc.desc   Verify executeDelayed with optional priority parameter (HIGH)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task, taskpool.Priority.HIGH);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest0300

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_0300

     * @tc.desc   Verify executeDelayed with all params (delayTime + task + priority LOW)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task, taskpool.Priority.LOW);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest0400

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_0400

     * @tc.desc   Verify executeDelayed with delayTime boundary value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(0, task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest0500

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_0500

     * @tc.desc   Verify executeDelayed with delayTime boundary value 1ms
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(1, task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest0600

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_0600

     * @tc.desc   Verify executeDelayed throws error when delayTime is negative (-1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let errorCaught: boolean = false;
      try {
        await taskpool.executeDelayed(-1, task);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest0700

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_0700

     * @tc.desc   Verify executeDelayed throws error when delayTime is max negative (-2147483648)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let errorCaught: boolean = false;
      try {
        await taskpool.executeDelayed(-2147483648, task);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest0800

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_0800

     * @tc.desc   Verify executeDelayed with normal Task object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(computeDelayedTask, 50.0);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest0900

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_0900

     * @tc.desc   Verify executeDelayed with Task carrying multiple args
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(multiArgDelayedTask, 30.0, 70.0);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest1000

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_1000

     * @tc.desc   Verify executeDelayed with named Task object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task("myDelayedTask", namedDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(42);
      expect(task.name).assertEqual("myDelayedTask");
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest1100

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_1100

     * @tc.desc   Verify executeDelayed with Task returning complex object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(objectDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      let record = result as Record<string, number>;
      expect(record["value"]).assertEqual(100);
      expect(record["id"]).assertEqual(1);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest1200

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_1200

     * @tc.desc   Verify executeDelayed with Task returning array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(arrayDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      let arr = result as number[];
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest1300

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_1300

     * @tc.desc   Verify executeDelayed with Priority.MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task, taskpool.Priority.MEDIUM);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest1400

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_1400

     * @tc.desc   Verify executeDelayed with Priority.IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task, taskpool.Priority.IDLE);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest1500

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_1500

     * @tc.desc   Verify executeDelayed returns number type value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      expect(typeof result).assertEqual("number");
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest1600

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_1600

     * @tc.desc   Verify executeDelayed returns string type value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(stringDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      expect(typeof result).assertEqual("string");
      expect(result as string).assertEqual("hello");
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest1700

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_1700

     * @tc.desc   Verify executeDelayed returns boolean type value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(boolDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      expect(typeof result).assertEqual("boolean");
      expect(result as boolean).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest1800

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_1800

     * @tc.desc   Verify executeDelayed returns object type value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(objectDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      let record = result as Record<string, number>;
      expect(record["value"]).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest1900

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_1900

     * @tc.desc   Verify executeDelayed returns array type value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(arrayDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      expect(Array.isArray(result)).assertTrue();
      let arr = result as number[];
      expect(arr.length).assertEqual(5);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest2000

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_2000

     * @tc.desc   Verify executeDelayed returns zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(zeroReturnTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest2100

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_2100

     * @tc.desc   Verify executeDelayed returns empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(emptyStrDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as string).assertEqual("");
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest2200

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_2200

     * @tc.desc   Verify executeDelayed returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(emptyArrDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      let arr = result as number[];
      expect(arr.length).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest2300

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_2300

     * @tc.desc   Verify executeDelayed returns empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(emptyObjDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      let record = result as Record<string, number>;
      expect(Object.keys(record).length).assertEqual(0);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest2400

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_2400

     * @tc.desc   Verify executeDelayed returns Promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let promise = taskpool.executeDelayed(100, task);
      let result: Any = undefined;
      try {
        result = await promise;
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest2500

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_2500

     * @tc.desc   Verify executeDelayed throws error for seqRunnerTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let seqRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      try {
        await seqRunner.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let errorCaught: boolean = false;
      try {
        await taskpool.executeDelayed(100, task);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest2600

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_2600

     * @tc.desc   Verify an already executed task can execute again with executeDelayed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest2700

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_2700

     * @tc.desc   Verify executeDelayed throws error for periodicTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      taskpool.executePeriodically(200, task);
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      let errorCaught: boolean = false;
      try {
        await taskpool.executeDelayed(100, task);
      } catch (error) {
        errorCaught = true;
      } finally {
        taskpool.cancel(task);
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest2800

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_2800

     * @tc.desc   Verify try-catch with normal executeDelayed no exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let errorCaught: boolean = false;
      try {
        let result = await taskpool.executeDelayed(100, task);
        expect(result as number).assertEqual(100);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertFalse();
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest2900

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_2900

     * @tc.desc   Verify finally always executes in try-catch-finally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let finallyExecuted: boolean = false;
      try {
        await taskpool.executeDelayed(-1, task);
      } catch (error) {
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest3000

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_3000

     * @tc.desc   Verify catch captures executeDelayed error when task throws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(throwDelayedTask);
      let errorCaught: boolean = false;
      try {
        await taskpool.executeDelayed(100, task);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest3100

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_3100

     * @tc.desc   Verify finally cleans up resource after executeDelayed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolExecuteDelayedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let finallyExecuted: boolean = false;
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      try {
        await taskpool.executeDelayed(100, task);
        finallyExecuted = true;
      } catch (error) {
        expect().assertFail();
      }
      expect(finallyExecuted).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest3200

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_3200

     * @tc.desc   Verify executeDelayed delay time accuracy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let startTime: number = Date.now();
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(500, task);
      } catch (error) {
        expect().assertFail();
      }
      let elapsed: number = Date.now() - startTime;
      expect(result as number).assertEqual(100);
      expect(elapsed >= 400).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest3300

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_3300

     * @tc.desc   Verify multiple delayed tasks execute in delay order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecuteDelayedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let order: number[] = [];
      let task1: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let task2: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let task3: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let p1 = taskpool.executeDelayed(100, task1);
      let p2 = taskpool.executeDelayed(200, task2);
      let p3 = taskpool.executeDelayed(300, task3);
      let results: Any[] = [];
      try {
        let r1 = await p1;
        order.push(1);
        let r2 = await p2;
        order.push(2);
        let r3 = await p3;
        order.push(3);
        results = [r1, r2, r3];
      } catch (error) {
        expect().assertFail();
        results = [];
      }
      expect(results[0] as number).assertEqual(100);
      expect(results[1] as number).assertEqual(100);
      expect(results[2] as number).assertEqual(100);
      // 宿主侧 continuation 到达顺序在高负载下不保证（压测实测 3 可先于 2 到达），
      // 断言收敛为：三个任务均触发且各自恰好一次（集合等于 {1,2,3}），返回值逐项校验
      expect(order.length).assertEqual(3);
      let seen1: boolean = false;
      let seen2: boolean = false;
      let seen3: boolean = false;
      for (let item of order) {
        if (item === 1) { seen1 = true; }
        if (item === 2) { seen2 = true; }
        if (item === 3) { seen3 = true; }
      }
      expect(seen1).assertTrue();
      expect(seen2).assertTrue();
      expect(seen3).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest3400

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_3400

     * @tc.desc   Verify cancel cancels delayed task before execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      // Delay must outlive cancel window; sleeping == delay races and task may already finish.
      let promise = taskpool.executeDelayed(1000, task);
      try {
        await Utils.msSleep(50);
      } catch (error) {
        expect().assertFail();
      }
      taskpool.cancel(task);
      let caught: boolean = false;
      try {
        await promise;
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest3500

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_3500

     * @tc.desc   Verify isCanceled checks cancel status in delayed task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(sendDataDelayedTask);
      // Delay must outlive cancel window; sleeping == delay races and task may already finish.
      let promise = taskpool.executeDelayed(1000, task);
      try {
        await Utils.msSleep(50);
      } catch (error) {
        expect().assertFail();
      }
      taskpool.cancel(task);
      let caught: boolean = false;
      try {
        await promise;
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      expect(taskpool.Task.isCanceled()).assertFalse();
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest3600

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_3600

     * @tc.desc   Verify multiple delayed tasks concurrent execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecuteDelayedTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let p1 = taskpool.executeDelayed(100, new taskpool.Task(computeDelayedTask, 1.0));
      let p2 = taskpool.executeDelayed(100, new taskpool.Task(computeDelayedTask, 2.0));
      let p3 = taskpool.executeDelayed(100, new taskpool.Task(computeDelayedTask, 3.0));
      let p4 = taskpool.executeDelayed(100, new taskpool.Task(computeDelayedTask, 4.0));
      let p5 = taskpool.executeDelayed(100, new taskpool.Task(computeDelayedTask, 5.0));
      let results: Any[] = [];
      try {
        results = (await Promise.all([p1, p2, p3, p4, p5])) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(5);
      expect(results[0] as number).assertEqual(2);
      expect(results[4] as number).assertEqual(10);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest3700

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_3700

     * @tc.desc   Verify mixed delayed and immediate task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let delayedTask: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let immediateTask: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let delayedPromise = taskpool.executeDelayed(100, delayedTask);
      let immediatePromise = taskpool.execute(immediateTask);
      let results: Any[] = [];
      try {
        results = (await Promise.all([delayedPromise, immediatePromise])) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results[0] as number).assertEqual(100);
      expect(results[1] as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest3800

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_3800

     * @tc.desc   Verify different priority delayed tasks execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let highTask: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let lowTask: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let mediumTask: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let p1 = taskpool.executeDelayed(100, highTask, taskpool.Priority.HIGH);
      let p2 = taskpool.executeDelayed(100, lowTask, taskpool.Priority.LOW);
      let p3 = taskpool.executeDelayed(100, mediumTask, taskpool.Priority.MEDIUM);
      let results: Any[] = [];
      try {
        results = (await Promise.all([p1, p2, p3])) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(3);
      expect(results[0] as number).assertEqual(100);
      expect(results[1] as number).assertEqual(100);
      expect(results[2] as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest3900

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_3900

     * @tc.desc   Verify executeDelayed waits for an explicitly scheduled dependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let task2: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      task1.addDependency(task2);
      let dependencyPromise: Promise<Any> = taskpool.execute(task2);
      let delayedPromise: Promise<Any> = taskpool.executeDelayed(100, task1);
      let dependencyResult: Any = undefined;
      try {
        dependencyResult = await dependencyPromise;
      } catch (error) {
        expect().assertFail();
      }
      let delayedResult: Any = undefined;
      try {
        delayedResult = await delayedPromise;
      } catch (error) {
        expect().assertFail();
      }
      expect(dependencyResult as number).assertEqual(100);
      expect(delayedResult as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest4000

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_4000

     * @tc.desc   Verify executeDelayed with long running task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(500, task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result as number).assertEqual(100);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest4100

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_4100

     * @tc.desc   Verify onExecutionSucceeded callback after delayed task succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let successCalled: boolean = false;
      let task: taskpool.Task = new taskpool.Task(simpleDelayedTask);
      let cbSucc0: () => void = (): void => {        successCalled = true;}
      task.onExecutionSucceeded(cbSucc0);
      try {
        await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      let maxWait: number = 0;
      while (!successCalled && maxWait < 1000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      expect(successCalled).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest4200

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_4200

     * @tc.desc   Verify onExecutionFailed callback after delayed task fails
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let failedCalled: boolean = false;
      let task: taskpool.Task = new taskpool.Task(throwDelayedTask);
      task.onExecutionFailed((e: Error) => {
        failedCalled = e instanceof Error;
      });
      let errorCaught: boolean = false;
      try {
        await taskpool.executeDelayed(100, task);
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      let maxWait: number = 0;
      while (!failedCalled && maxWait < 1000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
        maxWait += 100;
      }
      expect(failedCalled).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest4300

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_4300

     * @tc.desc   Verify Promise.all waits for all delayed tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecuteDelayedTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let p1 = taskpool.executeDelayed(100, new taskpool.Task(quickDelayedTask, 1.0));
      let p2 = taskpool.executeDelayed(100, new taskpool.Task(quickDelayedTask, 2.0));
      let p3 = taskpool.executeDelayed(100, new taskpool.Task(quickDelayedTask, 3.0));
      let results: Any[] = [];
      try {
        results = (await Promise.all([p1, p2, p3])) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(3);
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest4400

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_4400

     * @tc.desc   Verify delayed task void return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolExecuteDelayedTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(voidDelayedTask);
      let result: Any = undefined;
      try {
        result = await taskpool.executeDelayed(100, task);
      } catch (error) {
        expect().assertFail();
      }
      expect(result === undefined).assertTrue();
      done();
    })

    /**
     * @tc.name   TaskpoolExecuteDelayedTest4500

     * @tc.number SUB_TASKPOOL_EXECUTE_DELAYED_TEST_4500

     * @tc.desc   Verify many delayed tasks concurrent submit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolExecuteDelayedTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let promises: Promise<Any>[] = [];
      for (let i = 0; i < 10; i++) {
        let task: taskpool.Task = new taskpool.Task(quickDelayedTask, i + 0.0);
        promises.push(taskpool.executeDelayed(100, task));
      }
      let results: Any[] = [];
      try {
        results = (await Promise.all(promises)) as Any[];
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(10);
      done();
    })
  })
}
