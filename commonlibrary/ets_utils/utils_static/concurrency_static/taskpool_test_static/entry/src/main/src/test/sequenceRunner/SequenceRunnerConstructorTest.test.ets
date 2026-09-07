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

function delayTaskFunc(duration: number): number {
  let start: number = Date.now();
  while (Date.now() - start < duration) {}
  return duration + 0.0;
}

function throwErrorTask(): void {
  throw new Error('task error');
}

function returnArgTask(arg: number): number {
  return arg + 0.0;
}

export default function SequenceRunnerConstructorTest(): void {
  describe('SequenceRunnerConstructorTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   SequenceRunnerConstructorTest0100

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0100

     * @tc.desc   Verify SequenceRunner constructor with no priority uses default MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 100.0);
      try {
        await runner.execute(task1);
        expect(task1.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest0200

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0200

     * @tc.desc   Verify SequenceRunner constructor with Priority.HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.HIGH);
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 100.0);
      try {
        await runner.execute(task1);
        expect(task1.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest0300

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0300

     * @tc.desc   Verify SequenceRunner constructor with Priority.HIGH creates instance and executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.HIGH);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 100.0);
      try {
        await runner.execute(task);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest0400

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0400

     * @tc.desc   Verify SequenceRunner constructor with Priority.MEDIUM creates instance and executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.MEDIUM);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 100.0);
      try {
        await runner.execute(task);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest0500

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0500

     * @tc.desc   Verify SequenceRunner constructor with Priority.LOW creates instance and executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.LOW);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 100.0);
      try {
        await runner.execute(task);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest0600

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0600

     * @tc.desc   Verify SequenceRunner constructor with Priority.IDLE creates instance and executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.IDLE);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 100.0);
      try {
        await runner.execute(task);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest0700

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0700

     * @tc.desc   Verify SequenceRunner constructor with undefined priority uses default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner(undefined);
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 42.0);
      try {
        await runner.execute(task1);
        expect(task1.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest0800

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0800

     * @tc.desc   Verify SequenceRunner constructor creates different instances for different priorities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let runnerHigh: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.HIGH);
      let runnerLow: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.LOW);
      expect(runnerHigh === runnerLow).assertFalse();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest0900

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_0900

     * @tc.desc   Verify SequenceRunner instance can execute task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 42.0);
      try {
        let result: number = await runner.execute(task1) as number;
        expect(result).assertEqual(42);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1000

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1000

     * @tc.desc   Verify SequenceRunner instance can execute multiple tasks continuously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SequenceRunnerConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 10.0);
      let task2: taskpool.Task = new taskpool.Task(simpleReturnTask, 20.0);
      let task3: taskpool.Task = new taskpool.Task(simpleReturnTask, 30.0);
      try {
        let results = await Promise.all([runner.execute(task1), runner.execute(task2), runner.execute(task3)]);
        let result1: number = results[0] as number;
        let result2: number = results[1] as number;
        let result3: number = results[2] as number;
        expect(result1).assertEqual(10);
        expect(result2).assertEqual(20);
        expect(result3).assertEqual(30);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1100

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1100

     * @tc.desc   Verify SequenceRunner executes two tasks in serial order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(returnArgTask, 1.0);
      let task2: taskpool.Task = new taskpool.Task(returnArgTask, 2.0);
      try {
        let results = await Promise.all([runner.execute(task1), runner.execute(task2)]);
        let result1: number = results[0] as number;
        let result2: number = results[1] as number;
        expect(result1).assertEqual(1);
        expect(result2).assertEqual(2);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1200

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1200

     * @tc.desc   Verify SequenceRunner executes multiple tasks in serial order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(delayTaskFunc, 100.0);
      let task2: taskpool.Task = new taskpool.Task(delayTaskFunc, 100.0);
      let task3: taskpool.Task = new taskpool.Task(delayTaskFunc, 100.0);
      try {
        await Promise.all([
          runner.execute(task1),
          runner.execute(task2),
          runner.execute(task3)
        ]);
        expect(task1.isDone()).assertTrue();
        expect(task2.isDone()).assertTrue();
        expect(task3.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1300

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1300

     * @tc.desc   Verify next task starts after previous completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(delayTaskFunc, 200.0);
      let task2: taskpool.Task = new taskpool.Task(simpleReturnTask, 100.0);
      try {
        await runner.execute(task1);
        await runner.execute(task2);
        expect(task1.isDone()).assertTrue();
        expect(task2.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1400

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1400

     * @tc.desc   Verify subsequent task executes after previous task fails
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(throwErrorTask);
      let task2: taskpool.Task = new taskpool.Task(simpleReturnTask, 100.0);
      let errorCaught: boolean = false;
      try {
        await runner.execute(task1);
      } catch (error) {
        errorCaught = true;
      }
      try {
        let result: number = await runner.execute(task2) as number;
        expect(errorCaught).assertTrue();
        expect(result).assertEqual(100);
        expect(task2.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1500

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1500

     * @tc.desc   Verify subsequent task executes after previous task is canceled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let blocker: taskpool.Task = new taskpool.Task(delayTaskFunc, 500.0);
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      let task2: taskpool.Task = new taskpool.Task(simpleReturnTask, 42.0);
      let p0: Promise<Any> = runner.execute(blocker);
      let p1: Promise<Any> = runner.execute(task1);
      let task2Promise: Promise<Any> = runner.execute(task2);
      try {
        await Utils.msSleep(50);
        taskpool.cancel(task1);
        let cancelCaught: boolean = false;
        try {
          await p1;
        } catch (e) {
          cancelCaught = true;
        }
        let result2: number = await task2Promise as number;
        await p0;
        expect(cancelCaught).assertTrue();
        // Main thread is not a task, so Task.isCanceled() is false here
        expect(taskpool.Task.isCanceled()).assertFalse();
        expect(result2).assertEqual(42);
        expect(task2.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1600

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1600

     * @tc.desc   Verify each task returns independent Promise result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SequenceRunnerConstructorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 100.0);
      let task2: taskpool.Task = new taskpool.Task(simpleReturnTask, 200.0);
      try {
        let results = await Promise.all([runner.execute(task1), runner.execute(task2)]);
        let result1: number = results[0] as number;
        let result2: number = results[1] as number;
        expect(result1).assertEqual(100);
        expect(result2).assertEqual(200);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1700

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1700

     * @tc.desc   Verify SequenceRunners with different priorities each execute tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runnerHigh: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.HIGH);
      let runnerLow: taskpool.SequenceRunner = new taskpool.SequenceRunner(taskpool.Priority.LOW);
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      let task2: taskpool.Task = new taskpool.Task(simpleReturnTask, 2.0);
      try {
        await runnerHigh.execute(task1);
        await runnerLow.execute(task2);
        expect(task1.isDone()).assertTrue();
        expect(task2.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1800

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1800

     * @tc.desc   Verify multiple anonymous SequenceRunners execute independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner1: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let runner2: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 10.0);
      let task2: taskpool.Task = new taskpool.Task(simpleReturnTask, 20.0);
      try {
        await Promise.all([
          runner1.execute(task1),
          runner2.execute(task2)
        ]);
        expect(task1.isDone()).assertTrue();
        expect(task2.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest1900

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_1900

     * @tc.desc   Verify multi-task chain call result passing in SequenceRunner
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 10.0);
      let task2: taskpool.Task = new taskpool.Task(simpleReturnTask, 20.0);
      let task3: taskpool.Task = new taskpool.Task(simpleReturnTask, 30.0);
      try {
        let result1: number = await runner.execute(task1) as number;
        let result2: number = await runner.execute(task2) as number;
        let result3: number = await runner.execute(task3) as number;
        expect(result1 + result2 + result3).assertEqual(60);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest2000

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_2000

     * @tc.desc   Verify multiple tasks added to same SequenceRunner concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let taskPromises: Promise<Any>[] = [];
      let callbackPromises: Promise<void>[] = [];
      for (let i = 0; i < 5; i++) {
        let task: taskpool.Task = new taskpool.Task(simpleReturnTask, i + 0.0);
        taskPromises.push(runner.execute(task));
      }
      for (let i = 0; i < 5; i++) {
        try {
          let res: Any = await taskPromises[i];
          expect(res as number).assertEqual(i + 0.0);
          callbackPromises.push(Promise.resolve());
        } catch (error) {
        }
      }
      expect(callbackPromises.length).assertEqual(5);
      done();
    })

    /**
     * @tc.name   SequenceRunnerConstructorTest2100

     * @tc.number SUB_SEQUENCERUNNER_CONSTRUCTOR_TEST_2100

     * @tc.desc   Verify SequenceRunner executes task with delay function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SequenceRunnerConstructorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      let task1: taskpool.Task = new taskpool.Task(delayTaskFunc, 100.0);
      let task2: taskpool.Task = new taskpool.Task(delayTaskFunc, 100.0);
      try {
        await runner.execute(task1);
        await runner.execute(task2);
        expect(task1.isDone()).assertTrue();
        expect(task2.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })
  })
}
