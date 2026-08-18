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

function simpleReturnTask(args: number): number {
  return args + 0.0;
}

function stringReturnTask(args: string): string {
  return args;
}

function voidTask(): void {
}

function nullReturnTask(): null {
  return null;
}

function emptyStringTask(): string {
  return "";
}

function arrayReturnTask(): number[] {
  return [1, 2, 3];
}

function errorTask(): string {
  throw new Error("task error");
}

function delayTaskFunc(duration: number): number {
  let start: number = Date.now();
  while (Date.now() - start < duration) {
  }
  return duration + 0.0;
}

function multiArgTask(a: number, b: number, c: number): number {
  return a + b + c + 0.0;
}

function recordOrder(arr: number[], val: number): void {
  arr.push(val);
}

export default function AsyncRunnerExecuteTest(): void {
  describe('AsyncRunnerExecuteTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   AsyncRunnerExecuteTest0100

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_0100

     * @tc.desc   Verify AsyncRunner.execute with only task parameter and default priority MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 42.0);
      try {
        await runner.execute(task);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest0200

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_0200

     * @tc.desc   Verify AsyncRunner.execute with priority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 100.0);
      try {
        await runner.execute(task, taskpool.Priority.HIGH);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest0300

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_0300

     * @tc.desc   Verify AsyncRunner.execute with priority MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 200.0);
      try {
        await runner.execute(task, taskpool.Priority.MEDIUM);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest0400

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_0400

     * @tc.desc   Verify AsyncRunner.execute with priority LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 300.0);
      try {
        await runner.execute(task, taskpool.Priority.LOW);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest0500

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_0500

     * @tc.desc   Verify AsyncRunner.execute with priority IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 400.0);
      try {
        await runner.execute(task, taskpool.Priority.IDLE);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest0600

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_0600

     * @tc.desc   Verify AsyncRunner.execute with named Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task("myTask", simpleReturnTask, 500.0);
      try {
        await runner.execute(task);
        expect(task.isDone()).assertTrue();
        expect(task.name).assertEqual("myTask");
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest0700

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_0700

     * @tc.desc   Verify AsyncRunner.execute with Task containing multiple arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task(multiArgTask, 1.0, 2.0, 3.0);
      try {
        await runner.execute(task);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest0800

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_0800

     * @tc.desc   Verify AsyncRunner.execute returns correct standard value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task(stringReturnTask, "hello");
      try {
        let result: string = await runner.execute(task) as string;
        expect(result).assertEqual("hello");
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest0900

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_0900

     * @tc.desc   Verify AsyncRunner.execute Promise chain with then works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 99.0);
      let completed: boolean = false;
      try {
        let res: Any = await runner.execute(task);
        completed = true;
        expect(res as number).assertEqual(99.0);
      } catch (error) {
        expect().assertFail();
      }
      expect(completed).assertTrue();
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1000

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_1000

     * @tc.desc   Verify AsyncRunner.execute with void returning task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task(voidTask);
      try {
        await runner.execute(task);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1100

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_1100

     * @tc.desc   Verify AsyncRunner.execute with null returning task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task(nullReturnTask);
      try {
        let result: Object | null = await runner.execute(task) as Object | null;
        expect(result === null).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1200

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_1200

     * @tc.desc   Verify AsyncRunner.execute with empty string returning task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task(emptyStringTask);
      try {
        let result: string = await runner.execute(task) as string;
        expect(result).assertEqual("");
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1300

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_1300

     * @tc.desc   Verify AsyncRunner.execute with array returning task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task(arrayReturnTask);
      try {
        let result: number[] = await runner.execute(task) as number[];
        expect(result.length).assertEqual(3);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1400

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_1400

     * @tc.desc   Verify AsyncRunner.execute catches task error with try-catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task(errorTask);
      let hasError: boolean = false;
      try {
        await runner.execute(task);
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertTrue();
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1500

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_1500

     * @tc.desc   Verify AsyncRunner.execute catches task error with catch method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task(errorTask);
      let caughtError: boolean = false;
      try {
        await runner.execute(task);
      } catch (error) {
        caughtError = true;
      }
      expect(caughtError).assertTrue();
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1600

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_1600

     * @tc.desc   Verify AsyncRunner.execute throws error for groupTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let group: taskpool.TaskGroup = new taskpool.TaskGroup();
      group.addTask(simpleReturnTask, 1.0);
      let groupTask: taskpool.Task = new taskpool.Task(simpleReturnTask, 2.0);
      group.addTask(groupTask);
      let hasError: boolean = false;
      try {
        await runner.execute(groupTask);
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertTrue();
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1700

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_1700

     * @tc.desc   Verify AsyncRunner.execute throws error for task already executed by taskpool.execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      try {
        await taskpool.execute(task);
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
        let hasError: boolean = false;
        try {
          await runner.execute(task);
        } catch (e) {
          hasError = true;
        }
        expect(hasError).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1800

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_1800

     * @tc.desc   Verify AsyncRunner.execute throws error when executing same task twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      try {
        await runner.execute(task);
        let hasError: boolean = false;
        try {
          await runner.execute(task);
        } catch (e) {
          hasError = true;
        }
        expect(hasError).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1900

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_1900

     * @tc.desc   Verify AsyncRunner.execute throws error for dependent task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      let task2: taskpool.Task = new taskpool.Task(simpleReturnTask, 2.0);
      task2.addDependency(task1);
      let hasError: boolean = false;
      try {
        await runner.execute(task2);
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertTrue();
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2000

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_2000

     * @tc.desc   Verify AsyncRunner.execute throws error for periodic task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      taskpool.executePeriodically(200, task);
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let hasError: boolean = false;
      try {
        await runner.execute(task);
      } catch (e) {
        hasError = true;
      } finally {
        taskpool.cancel(task);
      }
      expect(hasError).assertTrue();
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2100

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_2100

     * @tc.desc   Verify AsyncRunner.execute throws error for seqRunner task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let seqRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task: taskpool.Task = new taskpool.Task(delayTaskFunc, 100.0);
      seqRunner.execute(task);
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let hasError: boolean = false;
      try {
        await runner.execute(task);
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertTrue();
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2200

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_2200

     * @tc.desc   Verify AsyncRunner.execute throws error for task executed by another AsyncRunner
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner1: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let runner2: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      try {
        await runner1.execute(task);
        let hasError: boolean = false;
        try {
          await runner2.execute(task);
        } catch (e) {
          hasError = true;
        }
        expect(hasError).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2300

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_2300

     * @tc.desc   Verify AsyncRunner.execute throws error for delayed task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(delayTaskFunc, 100.0);
      let delayedPromise = taskpool.executeDelayed(50, task);
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let hasError: boolean = false;
      try {
        await runner.execute(task);
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertTrue();
      try {
        await delayedPromise;
      } catch (e) {
        // delayed task may be canceled after runner.execute rejects it
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2400

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_2400

     * @tc.desc   Verify AsyncRunner.execute finally block executes regardless of success or failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      let errorCaught: boolean = false;
      let finallyCalled: boolean = false;
      try {
        await runner.execute(task);
      } catch (e) {
        errorCaught = true;
      } finally {
        finallyCalled = true;
      }
      expect(errorCaught).assertFalse();
      expect(finallyCalled).assertTrue();
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2500

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_2500

     * @tc.desc   Verify AsyncRunner.execute with runningCapacity=3 executes tasks concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(3, 0);
      let task1: taskpool.Task = new taskpool.Task(delayTaskFunc, 300.0);
      let task2: taskpool.Task = new taskpool.Task(delayTaskFunc, 300.0);
      let task3: taskpool.Task = new taskpool.Task(delayTaskFunc, 300.0);
      try {
        let results = await Promise.all([
          runner.execute(task1),
          runner.execute(task2),
          runner.execute(task3)
        ]);
        expect(results.length).assertEqual(3);
        expect(results[0] as number).assertEqual(300.0);
        expect(task1.isDone() && task2.isDone() && task3.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2600

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_2600

     * @tc.desc   Verify AsyncRunner.execute with runningCapacity=1 executes tasks serially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1, 0);
      let order: number[] = [];
      let task1: taskpool.Task = new taskpool.Task(recordOrder, order, 1.0);
      let task2: taskpool.Task = new taskpool.Task(recordOrder, order, 2.0);
      try {
        await Promise.all([
          runner.execute(task1),
          runner.execute(task2)
        ]);
        expect(order.length).assertEqual(2);
        expect(order[0]).assertEqual(1);
        expect(order[1]).assertEqual(2);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2700

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_2700

     * @tc.desc   Verify AsyncRunner.execute with runningCapacity=10 executes many tasks in parallel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 0);
      let completedCount: number = 0;
      let promises: Promise<Any>[] = [];
      for (let i = 0; i < 8; i++) {
        let task: taskpool.Task = new taskpool.Task(simpleReturnTask, i + 0.0);
        promises.push(runner.execute(task));
      }
      for (let i = 0; i < 8; i++) {
        try {
          await promises[i];
          completedCount++;
        } catch (error) {
        }
      }
      expect(completedCount).assertEqual(8);
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2800

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_2800

     * @tc.desc   Verify AsyncRunner.execute with waitingCapacity=0 queue mode all tasks complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let completedCount: number = 0;
      let promises: Promise<Any>[] = [];
      for (let i = 0; i < 50; i++) {
        let task: taskpool.Task = new taskpool.Task(simpleReturnTask, i + 0.0);
        promises.push(runner.execute(task));
      }
      for (let i = 0; i < 50; i++) {
        try {
          await promises[i];
          completedCount++;
        } catch (error) {
        }
      }
      expect(completedCount).assertEqual(50);
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2900

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_2900

     * @tc.desc   Verify AsyncRunner.execute with waitingCapacity=5 discard mode capacity limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1, 5);
      let longTask: taskpool.Task = new taskpool.Task(delayTaskFunc, 2000.0);
      let completedCount: number = 0;
      let rejectedCount: number = 0;
      let promises: Promise<Any>[] = [];
      promises.push(runner.execute(longTask));
      for (let i = 0; i < 10; i++) {
        let task: taskpool.Task = new taskpool.Task(simpleReturnTask, i + 0.0);
        promises.push(runner.execute(task));
      }
      for (let i = 0; i < 11; i++) {
        try {
          await promises[i];
          completedCount++;
        } catch (error) {
          rejectedCount++;
        }
      }
      expect(rejectedCount > 0).assertTrue();
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3000

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_3000

     * @tc.desc   Verify AsyncRunner.execute discard head when waiting queue exceeds capacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1, 2);
      let completedCount: number = 0;
      let rejectedCount: number = 0;
      let task1: taskpool.Task = new taskpool.Task(delayTaskFunc, 500.0);
      let task2: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      let task3: taskpool.Task = new taskpool.Task(simpleReturnTask, 2.0);
      let task4: taskpool.Task = new taskpool.Task(simpleReturnTask, 3.0);
      let task5: taskpool.Task = new taskpool.Task(simpleReturnTask, 4.0);
      let taskPromises3: Promise<Any>[] = [];
      taskPromises3.push(runner.execute(task1));
      taskPromises3.push(runner.execute(task2));
      taskPromises3.push(runner.execute(task3));
      taskPromises3.push(runner.execute(task4));
      taskPromises3.push(runner.execute(task5));
      for (let i = 0; i < 5; i++) {
        try {
          await taskPromises3[i];
          completedCount++;
        } catch (error) {
          rejectedCount++;
        }
      }
      expect(completedCount).assertEqual(3);
      expect(rejectedCount).assertEqual(2);
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3100

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_3100

     * @tc.desc   Verify AsyncRunner.execute with waitingCapacity equal to pending task count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 3);
      let completedCount: number = 0;
      let promises: Promise<Any>[] = [];
      for (let i = 0; i < 5; i++) {
        let task: taskpool.Task = new taskpool.Task(simpleReturnTask, i + 0.0);
        promises.push(runner.execute(task));
      }
      for (let i = 0; i < 5; i++) {
        try {
          await promises[i];
          completedCount++;
        } catch (error) {
        }
      }
      expect(completedCount).assertEqual(5);
      done();
    })



    /**
     * @tc.name   AsyncRunnerExecuteTest3200

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_3200

     * @tc.desc   Verify taskpool.execute supports dependency but AsyncRunner.execute does not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      let task2: taskpool.Task = new taskpool.Task(simpleReturnTask, 2.0);
      task2.addDependency(task1);
      try {
        await taskpool.execute(task1);
        await taskpool.execute(task2);
        expect(task1.isDone() && task2.isDone()).assertTrue();
        let task3: taskpool.Task = new taskpool.Task(simpleReturnTask, 3.0);
        let task4: taskpool.Task = new taskpool.Task(simpleReturnTask, 4.0);
        task4.addDependency(task3);
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
        let hasError: boolean = false;
        try {
          await runner.execute(task4);
        } catch (e) {
          hasError = true;
        }
        expect(hasError).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3300

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_3300

     * @tc.desc   Verify AsyncRunner.execute can retry with new task after failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let hasError: boolean = false;
      try {
        await runner.execute(new taskpool.Task(errorTask));
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertTrue();
      let retryTask: taskpool.Task = new taskpool.Task(stringReturnTask, "retry");
      try {
        let result: string = await runner.execute(retryTask) as string;
        expect(result).assertEqual("retry");
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3400

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_3400

     * @tc.desc   Verify multiple tasks share same AsyncRunner and collect results correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(3, 10);
      let completedCount: number = 0;

      let promises: Promise<Any>[] = [];
      for (let i = 1; i <= 5; i++) {
        let task: taskpool.Task = new taskpool.Task(simpleReturnTask, i + 0.0);
        promises.push(runner.execute(task));
      }
      for (let i = 1; i <= 5; i++) {
        try {
          await promises[i - 1];
          completedCount++;
        } catch (error) {
        }
      }
      expect(completedCount).assertEqual(5);
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3500

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_3500

     * @tc.desc   Verify AsyncRunner.execute sequential chain execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1, 0);
      let order: number[] = [];

try {

        await runner.execute(new taskpool.Task(recordOrder, order, 1.0));
        await runner.execute(new taskpool.Task(recordOrder, order, 2.0));
        await runner.execute(new taskpool.Task(recordOrder, order, 3.0));
        expect(order.length).assertEqual(3);
        expect(order[0]).assertEqual(1);
        expect(order[1]).assertEqual(2);
        expect(order[2]).assertEqual(3);

} catch (error) {

  expect().assertFail();

}
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3600

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_3600

     * @tc.desc   Verify AsyncRunner.execute parallel execution then merge results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(5, 0);
      let completedCount: number = 0;
      let promises: Promise<Any>[] = [];
      for (let i = 0; i < 10; i++) {
        let task: taskpool.Task = new taskpool.Task(simpleReturnTask, i + 0.0);
        promises.push(runner.execute(task));
      }
      for (let i = 0; i < 10; i++) {
        try {
          await promises[i];
          completedCount++;
        } catch (error) {
        }
      }
      expect(completedCount).assertEqual(10);
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3700

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_3700

     * @tc.desc   Verify AsyncRunner.execute mixed chain with sequential then parallel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(3, 0);
      let task1: taskpool.Task = new taskpool.Task(stringReturnTask, "first");
      try {
        await runner.execute(task1);
        let task2: taskpool.Task = new taskpool.Task(stringReturnTask, "second");
        let task3: taskpool.Task = new taskpool.Task(stringReturnTask, "third");
        await Promise.all([
          runner.execute(task2),
          runner.execute(task3)
        ]);
        expect(task1.isDone() && task2.isDone() && task3.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3800

     * @tc.number SUB_ASYNCRUNNER_EXECUTE_TEST_3800

     * @tc.desc   Verify AsyncRunner.execute same priority tasks execute in submission order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1, 0);
      let results: number[] = [];

      let promises: Promise<Any>[] = [];
      for (let i = 0; i < 5; i++) {
        let task: taskpool.Task = new taskpool.Task(recordOrder, results, i + 0.0);
        promises.push(runner.execute(task, taskpool.Priority.MEDIUM));
      }
      try {
        await Promise.all(promises);
        expect(results.length).assertEqual(5);
        for (let i = 0; i < 5; i++) {
          expect(results[i]).assertEqual(i + 0.0);
        }
      } catch (error) {
        expect().assertFail();
      }
      done();
    })


  })
}
