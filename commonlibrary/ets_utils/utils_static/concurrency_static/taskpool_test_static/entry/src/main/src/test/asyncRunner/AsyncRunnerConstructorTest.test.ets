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

function failTaskFunc(): number {
  throw new Error("async runner task failed");
}

export default function AsyncRunnerConstructorTest(): void {
  describe('AsyncRunnerConstructorTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   AsyncRunnerConstructorTest0100

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_0100

     * @tc.desc   Verify AsyncRunner constructor with only runningCapacity creates instance and executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      try {
        let result0100: number = await runner.execute(task) as number;
        expect(result0100).assertEqual(1.0);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest0200

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_0200

     * @tc.desc   Verify AsyncRunner constructor with runningCapacity and waitingCapacity creates instance and executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 10);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      try {
        let result0200: number = await runner.execute(task) as number;
        expect(result0200).assertEqual(1.0);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest0300

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_0300

     * @tc.desc   Verify AsyncRunner with runningCapacity=1 creates instance and executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      try {
        let result0300: number = await runner.execute(task) as number;
        expect(result0300).assertEqual(1.0);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest0400

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_0400

     * @tc.desc   Verify AsyncRunner with runningCapacity=10 creates instance and executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      try {
        let result0400: number = await runner.execute(task) as number;
        expect(result0400).assertEqual(1.0);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest0500

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_0500

     * @tc.desc   Verify AsyncRunner with runningCapacity=1000 creates instance and executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1000);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      try {
        let result0500: number = await runner.execute(task) as number;
        expect(result0500).assertEqual(1.0);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest0600

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_0600

     * @tc.desc   Verify AsyncRunner with runningCapacity=int max value 2147483647 creates instance and executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2147483647);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      try {
        let result0600: number = await runner.execute(task) as number;
        expect(result0600).assertEqual(1.0);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest0700

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_0700

     * @tc.desc   Verify AsyncRunner with runningCapacity=0 throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hasError: boolean = false;
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(0);
      } catch (error) {
        hasError = true;
      }
      expect(hasError).assertTrue();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest0800

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_0800

     * @tc.desc   Verify AsyncRunner with runningCapacity=-1 throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hasError: boolean = false;
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(-1);
      } catch (error) {
        hasError = true;
      }
      expect(hasError).assertTrue();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest0900

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_0900

     * @tc.desc   Verify AsyncRunner with runningCapacity=-100 throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hasError: boolean = false;
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(-100);
      } catch (error) {
        hasError = true;
      }
      expect(hasError).assertTrue();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1000

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_1000

     * @tc.desc   Verify AsyncRunner with runningCapacity=int min value -2147483648 throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hasError: boolean = false;
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(-2147483648);
      } catch (error) {
        hasError = true;
      }
      expect(hasError).assertTrue();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1100

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_1100

     * @tc.desc   Verify AsyncRunner with default waitingCapacity executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2);
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      try {
        let result1100: number = await runner.execute(task1) as number;
        expect(result1100).assertEqual(1.0);
        expect(task1.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1200

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_1200

     * @tc.desc   Verify AsyncRunner with waitingCapacity=0 executes task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      try {
        let result1200: number = await runner.execute(task1) as number;
        expect(result1200).assertEqual(1.0);
        expect(task1.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1300

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_1300

     * @tc.desc   Verify AsyncRunner with waitingCapacity=1 creates instance and executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 1);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      try {
        let result1300: number = await runner.execute(task) as number;
        expect(result1300).assertEqual(1.0);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1400

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_1400

     * @tc.desc   Verify AsyncRunner with waitingCapacity=5 creates instance and executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 5);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      try {
        let result1400: number = await runner.execute(task) as number;
        expect(result1400).assertEqual(1.0);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1500

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_1500

     * @tc.desc   Verify AsyncRunner with waitingCapacity=100 creates instance and executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 100);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      try {
        let result1500: number = await runner.execute(task) as number;
        expect(result1500).assertEqual(1.0);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1600

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_1600

     * @tc.desc   Verify AsyncRunner with waitingCapacity=int max 2147483647 creates instance and executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 2147483647);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      try {
        let result1600: number = await runner.execute(task) as number;
        expect(result1600).assertEqual(1.0);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1700

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_1700

     * @tc.desc   Verify AsyncRunner with waitingCapacity=-1 throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hasError: boolean = false;
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, -1);
      } catch (error) {
        hasError = true;
      }
      expect(hasError).assertTrue();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1800

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_1800

     * @tc.desc   Verify AsyncRunner with waitingCapacity=-100 throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hasError: boolean = false;
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, -100);
      } catch (error) {
        hasError = true;
      }
      expect(hasError).assertTrue();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest1900

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_1900

     * @tc.desc   Verify AsyncRunner with waitingCapacity=int min -2147483648 throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerConstructorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hasError: boolean = false;
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, -2147483648);
      } catch (error) {
        hasError = true;
      }
      expect(hasError).assertTrue();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest2000

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_2000

     * @tc.desc   Verify combination of runningCapacity=1 and waitingCapacity=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1, 0);
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 42.0);
      try {
        let result2000: number = await runner.execute(task1) as number;
        expect(result2000).assertEqual(42.0);
        expect(task1.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest2100

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_2100

     * @tc.desc   Verify combination of runningCapacity=1 and waitingCapacity=5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1, 5);
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 100.0);
      try {
        let result2100: number = await runner.execute(task1) as number;
        expect(result2100).assertEqual(100.0);
        expect(task1.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest2200

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_2200

     * @tc.desc   Verify combination of runningCapacity=5 and waitingCapacity=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(5, 0);
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 200.0);
      try {
        let result2200: number = await runner.execute(task1) as number;
        expect(result2200).assertEqual(200.0);
        expect(task1.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest2300

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_2300

     * @tc.desc   Verify combination of runningCapacity=5 and waitingCapacity=10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(5, 10);
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 300.0);
      try {
        let result2300: number = await runner.execute(task1) as number;
        expect(result2300).assertEqual(300.0);
        expect(task1.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest2400

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_2400

     * @tc.desc   Verify AsyncRunner constructor with runningCapacity=5 and waitingCapacity=20 executes task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerConstructorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(5, 20);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1.0);
      try {
        let result2400: number = await runner.execute(task) as number;
        expect(result2400).assertEqual(1.0);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })



    /**
     * @tc.name   AsyncRunnerConstructorTest2500

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_2500

     * @tc.desc   Verify AsyncRunner with runningCapacity=1 executes tasks serially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1);
      let task1: taskpool.Task = new taskpool.Task(delayTaskFunc, 200.0);
      let task2: taskpool.Task = new taskpool.Task(delayTaskFunc, 200.0);
      let task3: taskpool.Task = new taskpool.Task(delayTaskFunc, 200.0);
      try {
        let results = await Promise.all([
          runner.execute(task1),
          runner.execute(task2),
          runner.execute(task3)
        ]);
        expect(results.length).assertEqual(3);
        expect(results[0] as number).assertEqual(200.0);
        expect(task1.isDone() && task2.isDone() && task3.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest2600

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_2600

     * @tc.desc   Verify AsyncRunner with runningCapacity=3 executes tasks concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(3);
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
     * @tc.name   AsyncRunnerConstructorTest2700

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_2700

     * @tc.desc   Verify AsyncRunner with waitingCapacity=0 all tasks complete in queue mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0);
      let callbackPromises: Promise<void>[] = [];
      let taskPromises: Promise<Any>[] = [];
      for (let i = 0; i < 10; i++) {
        let task: taskpool.Task = new taskpool.Task(simpleReturnTask, i + 0.0);
        taskPromises.push(runner.execute(task));
      }
      for (let i = 0; i < 10; i++) {
        try {
          await taskPromises[i];
          callbackPromises.push(Promise.resolve());
        } catch (error) {
        }
      }
      expect(callbackPromises.length).assertEqual(10);
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest2800

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_2800

     * @tc.desc   Verify AsyncRunner with waitingCapacity>0 discards head tasks when queue is full
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1, 2);
      let completedIds: number[] = [];
      let rejectedCount: number = 0;
      let task1: taskpool.Task = new taskpool.Task(delayTaskFunc, 500.0);
      let task2: taskpool.Task = new taskpool.Task(simpleReturnTask, 2.0);
      let task3: taskpool.Task = new taskpool.Task(simpleReturnTask, 3.0);
      let task4: taskpool.Task = new taskpool.Task(simpleReturnTask, 4.0);
      let task5: taskpool.Task = new taskpool.Task(simpleReturnTask, 5.0);
      let taskPromises2: Promise<Any>[] = [];
      taskPromises2.push(runner.execute(task1));
      taskPromises2.push(runner.execute(task2));
      taskPromises2.push(runner.execute(task3));
      taskPromises2.push(runner.execute(task4));
      taskPromises2.push(runner.execute(task5));
      for (let i = 0; i < 5; i++) {
        try {
          await taskPromises2[i];
          completedIds.push(i + 1);
        } catch (error) {
          rejectedCount++;
        }
      }
      expect(rejectedCount).assertEqual(2);
      expect(completedIds.length).assertEqual(3);
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest2900

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_2900

     * @tc.desc   Verify AsyncRunner with 100 tasks executes stably
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(10, 0);
      let callbackPromises: Promise<void>[] = [];
      let taskPromises: Promise<Any>[] = [];
      for (let i = 0; i < 100; i++) {
        let task: taskpool.Task = new taskpool.Task(simpleReturnTask, i + 0.0);
        taskPromises.push(runner.execute(task));
      }
      for (let i = 0; i < 100; i++) {
        try {
          await taskPromises[i];
          callbackPromises.push(Promise.resolve());
        } catch (error) {
        }
      }
      expect(callbackPromises.length).assertEqual(100);
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest3000

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_3000

     * @tc.desc   Verify one task failure does not affect other tasks in AsyncRunner
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2);
      let successCount: AtomicInt = new AtomicInt(0);
      let failTask: taskpool.Task = new taskpool.Task(failTaskFunc);
      let okTask: taskpool.Task = new taskpool.Task(simpleReturnTask, 2.0);
      let failRejected: boolean = false;
      let okRejected: boolean = false;
      // One failing task must not prevent the other from completing.
      let failPromise: Promise<Any> = runner.execute(failTask);
      let okPromise: Promise<Any> = runner.execute(okTask);
      try {
        await failPromise;
        successCount.fetchAdd(1);
      } catch (error) {
        failRejected = true;
      }
      try {
        await okPromise;
        successCount.fetchAdd(1);
      } catch (error) {
        okRejected = true;
      }
      expect(failRejected).assertTrue();
      expect(okRejected).assertFalse();
      expect(successCount.load()).assertEqual(1);
      done();
    })

    /**
     * @tc.name   AsyncRunnerConstructorTest3100

     * @tc.number SUB_ASYNCRUNNER_CONSTRUCTOR_TEST_3100

     * @tc.desc   Verify AsyncRunner with runningCapacity=5 executes tasks with max 5 concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerConstructorTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(5);
      let task1: taskpool.Task = new taskpool.Task(delayTaskFunc, 300.0);
      let task2: taskpool.Task = new taskpool.Task(delayTaskFunc, 300.0);
      let task3: taskpool.Task = new taskpool.Task(delayTaskFunc, 300.0);
      let task4: taskpool.Task = new taskpool.Task(delayTaskFunc, 300.0);
      let task5: taskpool.Task = new taskpool.Task(delayTaskFunc, 300.0);
      try {
        let results = await Promise.all([
          runner.execute(task1),
          runner.execute(task2),
          runner.execute(task3),
          runner.execute(task4),
          runner.execute(task5)
        ]);
        expect(results.length).assertEqual(5);
        expect(results[0] as number).assertEqual(300.0);
        expect(task1.isDone() && task5.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })
  })
}
