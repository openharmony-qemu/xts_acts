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

function errorTask(): void {
  throw new Error("task error");
}

function notifyStartTask(duration: number): number {
  taskpool.Task.sendData(duration);
  let start: number = Date.now();
  while (Date.now() - start < duration) {}
  return duration + 0.0;
}

export default function TaskCallbackFunctionTest(): void {
  describe('TaskCallbackFunctionTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskCallbackFunctionTest0100
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_0100
     * @tc.desc   Verify onEnqueued callback fires when task is enqueued
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskCallbackFunctionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let enqueuedFlag: boolean = false;
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 100.0);
      let cbEnq0: () => void = (): void => {
        enqueuedFlag = true;
      }
      task.onEnqueued(cbEnq0);
      try {
        await taskpool.execute(task);
        expect(enqueuedFlag).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest0200
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_0200
     * @tc.desc   Verify arrow function as CallbackFunction with onStartExecution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskCallbackFunctionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let startFlag: boolean = false;
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 200.0);
      let cbStart0: () => void = (): void => {
        startFlag = true;
      }
      task.onStartExecution(cbStart0);
      try {
        await taskpool.execute(task);
        expect(startFlag).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest0300
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_0300
     * @tc.desc   Verify arrow function assigned to variable as CallbackFunction with onExecutionSucceeded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskCallbackFunctionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let successFlag: boolean = false;
      let onSuccessCallback: () => void = (): void => {
        successFlag = true;
      };
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 300.0);
      task.onExecutionSucceeded(onSuccessCallback);
      try {
        await taskpool.execute(task);
        expect(successFlag).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest0400
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_0400
     * @tc.desc   Verify CallbackFunction with explicit return statement without value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskCallbackFunctionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let returnFlag: boolean = false;
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 400.0);
      let cbEnq1: () => void = (): void => {
        returnFlag = true;
        return;
      }
      task.onEnqueued(cbEnq1);
      try {
        await taskpool.execute(task);
        expect(returnFlag).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest0500
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_0500
     * @tc.desc   Verify CallbackFunction returns undefined is compatible with void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskCallbackFunctionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let undefinedFlag: boolean = false;
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 500.0);
      let cbEnq2: () => void = (): void => {
        undefinedFlag = true;
        return undefined;
      }
      task.onEnqueued(cbEnq2);
      try {
        await taskpool.execute(task);
        expect(undefinedFlag).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest0600
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_0600
     * @tc.desc   Verify empty function body as CallbackFunction executes normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskCallbackFunctionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 600.0);
      let cbEnq3: () => void = (): void => {}
      task.onEnqueued(cbEnq3);
      try {
        await taskpool.execute(task);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest0700
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_0700
     * @tc.desc   Verify CallbackFunction throws Error in onEnqueued does not affect task completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskCallbackFunctionTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 700.0);
      let cbEnq4: () => void = (): void => {
        throw new Error("callback error");
      }
      task.onEnqueued(cbEnq4);
      try {
        await taskpool.execute(task);
        expect(task.isDone()).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest0800
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_0800
     * @tc.desc   Verify try-catch inside CallbackFunction catches error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskCallbackFunctionTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caughtFlag: boolean = false;
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 800.0);
      let cbEnq5: () => void = (): void => {
        try {
          throw new Error("inner error");
        } catch (e) {
          caughtFlag = true;
        }
      }
      task.onEnqueued(cbEnq5);
      try {
        await taskpool.execute(task);
        expect(caughtFlag).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest0900
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_0900
     * @tc.desc   Verify registering onEnqueued after task execution throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskCallbackFunctionTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 900.0);
      try {
        await taskpool.execute(task);
        let hasError: boolean = false;
        try {
          let cbEnq6: () => void = (): void => {
            try {
              throw new Error("onEnqueued callback must not be invoked after task execution");
            } catch (error) {
              expect().assertFail();
            }
          }
          task.onEnqueued(cbEnq6);
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
     * @tc.name   TaskCallbackFunctionTest1000
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_1000
     * @tc.desc   Verify registering onStartExecution while task is running throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskCallbackFunctionTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(notifyStartTask, 500.0);
      let startedPromise: Promise<void> = new Promise<void>((resolve: (value: void | PromiseLike<void>) => void, reject: (reason: Error) => void) => {
        task.onReceiveData((data: number) => {
          if (data >= 0) {
            resolve(undefined);
          }
        });
      });
      let executePromise = taskpool.execute(task);
      try {
        await startedPromise;
        let hasError: boolean = false;
        try {
          let cbStart1: () => void = (): void => {
            try {
              throw new Error("onStartExecution callback must not be invoked while task is running");
            } catch (error) {
              expect().assertFail();
            }
          }
          task.onStartExecution(cbStart1);
          expect().assertFail();
        } catch (e) {
          hasError = true;
        }
        expect(hasError).assertTrue();
        await executePromise;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })



    /**
     * @tc.name   TaskCallbackFunctionTest1100
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_1100
     * @tc.desc   Verify onEnqueued and onStartExecution each fire once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskCallbackFunctionTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let enqueuedCount: AtomicInt = new AtomicInt(0);
      let startCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1200.0);
      let cbEnq7: () => void = (): void => {
        enqueuedCount.fetchAdd(1);
      }
      task.onEnqueued(cbEnq7);
      let cbStart2: () => void = (): void => {
        startCount.fetchAdd(1);
      }
      task.onStartExecution(cbStart2);
      try {
        await taskpool.execute(task);
        expect(enqueuedCount.load()).assertEqual(1);
        expect(startCount.load()).assertEqual(1);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest1200
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_1200
     * @tc.desc   Verify onStartExecution callback fires when task starts execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskCallbackFunctionTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let startFlag: boolean = false;
      let task: taskpool.Task = new taskpool.Task(delayTaskFunc, 200.0);
      let cbStart3: () => void = (): void => {
        startFlag = true;
      }
      task.onStartExecution(cbStart3);
      try {
        await taskpool.execute(task);
        expect(startFlag).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest1300
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_1300
     * @tc.desc   Verify onExecutionSucceeded callback fires when task succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskCallbackFunctionTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let successCalled: boolean = false;
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1400.0);
      let cbSucc0: () => void = (): void => {
        successCalled = true;
      }
      task.onExecutionSucceeded(cbSucc0);
      try {
        await taskpool.execute(task);
        expect(successCalled).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest1400
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_1400
     * @tc.desc   Verify onEnqueued, onStartExecution and onExecutionSucceeded each fire once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskCallbackFunctionTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let enqueuedCount: AtomicInt = new AtomicInt(0);
      let startCount: AtomicInt = new AtomicInt(0);
      let successCount: AtomicInt = new AtomicInt(0);
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1500.0);
      let cbEnq8: () => void = (): void => {
        enqueuedCount.fetchAdd(1);
      }
      task.onEnqueued(cbEnq8);
      let cbStart4: () => void = (): void => {
        startCount.fetchAdd(1);
      }
      task.onStartExecution(cbStart4);
      let cbSucc1: () => void = (): void => {
        successCount.fetchAdd(1);
      }
      task.onExecutionSucceeded(cbSucc1);
      try {
        let result: number = await taskpool.execute(task) as number;
        expect(result).assertEqual(1500.0);
        expect(enqueuedCount.load()).assertEqual(1);
        expect(startCount.load()).assertEqual(1);
        expect(successCount.load()).assertEqual(1);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest1500
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_1500
     * @tc.desc   Verify multiple onEnqueued registrations, only last callback takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskCallbackFunctionTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let firstFired: boolean = false;
      let callMessage: string = "";
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 1600.0);
      let cbEnq9: () => void = (): void => {
        firstFired = true;
        callMessage = "first";
      }
      task.onEnqueued(cbEnq9);
      let cbEnq10: () => void = (): void => {
        callMessage = "second";
      }
      task.onEnqueued(cbEnq10);
      try {
        await taskpool.execute(task);
        expect(firstFired).assertFalse();
        expect(callMessage).assertEqual("second");
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest1600
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_1600
     * @tc.desc   Verify multiple tasks share callback state with count verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskCallbackFunctionTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: AtomicInt = new AtomicInt(0);
      let tasks: taskpool.Task[] = [];
      for (let i: number = 0; i < 5; i++) {
        let t: taskpool.Task = new taskpool.Task(simpleReturnTask, i + 0.0);
        let cbEnq11: () => void = (): void => {          counter.fetchAdd(1);}
        t.onEnqueued(cbEnq11);
        tasks.push(t);
      }
      try {
        await Promise.all(tasks.map((t: taskpool.Task) => {
          return taskpool.execute(t);
        }));
        expect(counter.load()).assertEqual(5);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest1700
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_1700
     * @tc.desc   Verify onStartExecution fires before cancel, onExecutionSucceeded does not fire after cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskCallbackFunctionTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let startCalled: boolean = false;
      let successCalled: boolean = false;
      let task: taskpool.Task = new taskpool.Task(delayTaskFunc, 2000.0);
      let cbStart5: () => void = (): void => {
        startCalled = true;
      }
      task.onStartExecution(cbStart5);
      let cbSucc2: () => void = (): void => {
        successCalled = true;
      }
      task.onExecutionSucceeded(cbSucc2);
      let executePromise = taskpool.execute(task);
      // Poll until onStartExecution fires (task has started executing)
      try {
        for (let i: number = 0; i < 30; i++) {
          if (startCalled) {
            break;
          }
          await Utils.msSleep(100);
        }
        taskpool.cancel(task);
        expect(startCalled).assertTrue();
        expect(successCalled).assertFalse();
      } catch (error) {
        expect().assertFail();
      }
      try {
        await executePromise;
      } catch (e) {
        // Cancellation may reject the execute promise; expected and safe to ignore
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest1800
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_1800
     * @tc.desc   Verify cancel during task execution succeeds and the execute promise settles
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskCallbackFunctionTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(delayTaskFunc, 2000.0);
      let executePromise = taskpool.execute(task);
      try {
        await Utils.msSleep(100);
        taskpool.cancel(task);
        let settled: boolean = false;
        try {
          await executePromise;
          settled = true;
        } catch (e) {
          settled = true;
        }
        expect(settled).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest1900
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_1900
     * @tc.desc   Verify onExecutionSucceeded does not fire when task times out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskCallbackFunctionTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let successCalled: boolean = false;
      let task: taskpool.Task = new taskpool.Task(delayTaskFunc, 5000.0);
      let cbSucc3: () => void = (): void => {
        successCalled = true;
      }
      task.onExecutionSucceeded(cbSucc3);
      let timeoutPromise: Promise<Any> = taskpool.execute(task, { timeout: 500 });
      // 等待超过 timeout(500ms)，确认超时路径不会误触发 onExecutionSucceeded
      try {
        await Utils.msSleep(800);
        try {
          await timeoutPromise;
        } catch (error) {
          // Timeout rejects the execute promise; expected and safe to ignore here
        }
        expect(successCalled).assertFalse();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest2000
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_2000
     * @tc.desc   Verify onExecutionSucceeded callback triggers next task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskCallbackFunctionTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let nextTaskTriggered: boolean = false;
      let task2Promise: Promise<Any> | undefined = undefined;
      let task1: taskpool.Task = new taskpool.Task(simpleReturnTask, 2301.0);
      let task2: taskpool.Task = new taskpool.Task(simpleReturnTask, 2302.0);
      let cbSucc4: () => void = (): void => {
  task2Promise = taskpool.execute(task2);
  nextTaskTriggered = true;
}
      task1.onExecutionSucceeded(cbSucc4);
      try {
        await taskpool.execute(task1);
        expect(nextTaskTriggered).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      if (task2Promise !== undefined) {
        try {
          await task2Promise;
        } catch (error) {
        }
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest2100
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_2100
     * @tc.desc   Verify onExecutionSucceeded does not fire when task fails with error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskCallbackFunctionTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let successCalled: boolean = false;
      let task: taskpool.Task = new taskpool.Task(errorTask);
      let cbSucc5: () => void = (): void => {
        successCalled = true;
      }
      task.onExecutionSucceeded(cbSucc5);
      try {
        await taskpool.execute(task);
        expect().assertFail();
      } catch (e) {
        }
      expect(successCalled).assertFalse();
      done();
    })



    /**
     * @tc.name   TaskCallbackFunctionTest2200
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_2200
     * @tc.desc   Verify only one of onExecutionSucceeded or onExecutionFailed fires
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskCallbackFunctionTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let successCalled: boolean = false;
      let failedCalled: boolean = false;
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 2600.0);
      let cbSucc6: () => void = (): void => {
        successCalled = true;
      }
      task.onExecutionSucceeded(cbSucc6);
      task.onExecutionFailed((e: Error) => {
        failedCalled = e instanceof Error;
      });
      try {
        await taskpool.execute(task);
        expect(successCalled).assertTrue();
        expect(failedCalled).assertFalse();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest2300
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_2300
     * @tc.desc   Verify TaskGroup task onEnqueued callback fires
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskCallbackFunctionTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callbackFired: boolean = false;
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup();
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 2700.0);
      let cbEnq12: () => void = (): void => {
        callbackFired = true;
      }
      task.onEnqueued(cbEnq12);
      taskGroup.addTask(task);
      try {
        await taskpool.execute(taskGroup);
        expect(callbackFired).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest2400
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_2400
     * @tc.desc   Verify SequenceRunner task onStartExecution callback fires
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskCallbackFunctionTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let startFlag: boolean = false;
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 2800.0);
      let cbStart6: () => void = (): void => {        startFlag = true;}
      task.onStartExecution(cbStart6);
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner();
      try {
        await runner.execute(task);
        expect(startFlag).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest2500
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_2500
     * @tc.desc   Verify AsyncRunner task onExecutionSucceeded callback fires
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskCallbackFunctionTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let successFlag: boolean = false;
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 2900.0);
      let cbSucc7: () => void = (): void => {
        successFlag = true;
      }
      task.onExecutionSucceeded(cbSucc7);
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2);
      try {
        await runner.execute(task);
        expect(successFlag).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest2600
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_2600
     * @tc.desc   Verify periodic task executes in taskpool and can be cancelled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskCallbackFunctionTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let executionFlag: boolean = false;
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 3000.0);
      let cbSucc8: () => void = (): void => {        executionFlag = true;}
      task.onExecutionSucceeded(cbSucc8);
      taskpool.executePeriodically(300, task);
      // 轮询确认至少一次周期回调已执行再取消（固定 1000ms 等待在负载下可能早于首个周期而 cancel，导致 executionFlag 仍为 false）
      let begin2600: number = Date.now();
      try {
        while (!executionFlag && Date.now() - begin2600 < 10000) {
          await Utils.msSleep(20);
        }
        taskpool.cancel(task.taskId.toInt());
        expect(executionFlag).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionTest2700
     * @tc.number SUB_TASK_CALLBACKFUNCTION_TEST_2700
     * @tc.desc   Verify delayed task onEnqueued callback fires after delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskCallbackFunctionTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let enqueuedFlag: boolean = false;
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 3100.0);
      let cbEnq13: () => void = (): void => {        enqueuedFlag = true;}
      task.onEnqueued(cbEnq13);
      let delayedPromise: Promise<Any> = taskpool.executeDelayed(100, task);
      try {
        await Utils.msSleep(200);
        try {
          await delayedPromise;
        } catch (error) {
        }
        expect(enqueuedFlag).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })
  })
}
