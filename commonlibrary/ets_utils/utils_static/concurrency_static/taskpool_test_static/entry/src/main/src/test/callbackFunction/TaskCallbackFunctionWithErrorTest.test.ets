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

function typeErrorTask(): void {
  throw new TypeError("type mismatch in task");
}

function sendDataAndFail(): void {
  taskpool.Task.sendData("progress data");
  throw new Error("failed after sendData");
}

export default function TaskCallbackFunctionWithErrorTest(): void {
  describe('TaskCallbackFunctionWithErrorTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskCallbackFunctionWithErrorTest0100
     * @tc.number SUB_TASK_CALLBACKFUNCTIONWITHERROR_TEST_0100
     * @tc.desc   Verify onExecutionFailed callback fires when task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskCallbackFunctionWithErrorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let callbackFired: boolean = false;
      let task: taskpool.Task = new taskpool.Task(errorTask);
      task.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          callbackFired = true;
        }
      });
      try {
        await taskpool.execute(task);
      } catch (e) {
        }
      try {
        await Utils.msSleep(100);
        expect(callbackFired).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionWithErrorTest0200
     * @tc.number SUB_TASK_CALLBACKFUNCTIONWITHERROR_TEST_0200
     * @tc.desc   Verify registering onExecutionFailed after task execution throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskCallbackFunctionWithErrorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 2900.0);
      try {
        await taskpool.execute(task);
        let hasError: boolean = false;
        try {
          task.onExecutionFailed((e: Error) => {
            let failureReason: Error | null = e;
            if (failureReason !== null) {
              // callback is not expected to run: registration after execution throws instead
            }
          });
        } catch (err) {
          hasError = true;
        }
        expect(hasError).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionWithErrorTest0300
     * @tc.number SUB_TASK_CALLBACKFUNCTIONWITHERROR_TEST_0300
     * @tc.desc   Verify onExecutionFailed does not fire when task executes successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskCallbackFunctionWithErrorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let failedCalled: boolean = false;
      let task: taskpool.Task = new taskpool.Task(simpleReturnTask, 3100.0);
      task.onExecutionFailed((e: Error) => {
        failedCalled = e instanceof Error || failedCalled;
      });
      try {
        await taskpool.execute(task);
        expect(failedCalled).assertFalse();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionWithErrorTest0400
     * @tc.number SUB_TASK_CALLBACKFUNCTIONWITHERROR_TEST_0400
     * @tc.desc   Verify onExecutionFailed fires when task throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskCallbackFunctionWithErrorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let callbackFired: boolean = false;
      let task: taskpool.Task = new taskpool.Task(typeErrorTask);
      task.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          callbackFired = true;
        }
      });
      try {
        await taskpool.execute(task);
      } catch (e) {
        }
      try {
        await Utils.msSleep(100);
        expect(callbackFired).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionWithErrorTest0500
     * @tc.number SUB_TASK_CALLBACKFUNCTIONWITHERROR_TEST_0500
     * @tc.desc   Verify multiple onExecutionFailed registrations, only last callback takes effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskCallbackFunctionWithErrorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let firstFired: boolean = false;
      let secondFired: boolean = false;
      let lastMessage: string = "";
      let task: taskpool.Task = new taskpool.Task(errorTask);
      task.onExecutionFailed((e: Error) => {
        firstFired = true;
        lastMessage = e instanceof Error ? "first" : "first";
      });
      task.onExecutionFailed((e: Error) => {
        secondFired = true;
        lastMessage = e instanceof Error ? "second" : "second";
      });
      task.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          lastMessage = "third";
        }
      });
      try {
        await taskpool.execute(task);
      } catch (e) {
        }
      try {
        await Utils.msSleep(100);
        expect(firstFired).assertFalse();
        expect(secondFired).assertFalse();
        expect(lastMessage).assertEqual("third");
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionWithErrorTest0600
     * @tc.number SUB_TASK_CALLBACKFUNCTIONWITHERROR_TEST_0600
     * @tc.desc   Verify multiple tasks share same onExecutionFailed callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskCallbackFunctionWithErrorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callbackCount: AtomicInt = new AtomicInt(0);
      let allCallbacksFired: Promise<void> = new Promise<void>((resolve: (value: void | PromiseLike<void>) => void, reject: (reason: Error) => void) => {
        let sharedCallback = (e: Error): void => {
          if (callbackCount.fetchAdd(1) + 1 === 2) {
            resolve(undefined);
          }
        };
        let task1: taskpool.Task = new taskpool.Task(errorTask);
        let task2: taskpool.Task = new taskpool.Task(errorTask);
        task1.onExecutionFailed(sharedCallback);
        task2.onExecutionFailed(sharedCallback);
        (async (): Promise<void> => {
          try {
            await Promise.all([
              taskpool.execute(task1),
              taskpool.execute(task2)
            ]);
          } catch (error) {
            // Task rejections are expected; failure callbacks are counted via sharedCallback
          }
        })();
      });
      try {
        await allCallbacksFired;
        expect(callbackCount.load()).assertEqual(2);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

/**
     * @tc.name   TaskCallbackFunctionWithErrorTest0700
     * @tc.number SUB_TASK_CALLBACKFUNCTIONWITHERROR_TEST_0700
     * @tc.desc   Verify multiple failing tasks each trigger onExecutionFailed once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskCallbackFunctionWithErrorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let failureCount: AtomicInt = new AtomicInt(0);
      let allCallbacksFired: Promise<void> = new Promise<void>((resolve: (value: void | PromiseLike<void>) => void, reject: (reason: Error) => void) => {
        let countingCallback = (e: Error): void => {
          if (failureCount.fetchAdd(1) + 1 === 3) {
            resolve(undefined);
          }
        };
        let task1: taskpool.Task = new taskpool.Task(errorTask);
        let task2: taskpool.Task = new taskpool.Task(errorTask);
        let task3: taskpool.Task = new taskpool.Task(errorTask);
        task1.onExecutionFailed(countingCallback);
        task2.onExecutionFailed(countingCallback);
        task3.onExecutionFailed(countingCallback);
        (async (): Promise<void> => {
          try {
            await Promise.all([
              taskpool.execute(task1),
              taskpool.execute(task2),
              taskpool.execute(task3)
            ]);
          } catch (error) {
            // Task rejections are expected; failure callbacks are counted via countingCallback
          }
        })();
      });
      try {
        await allCallbacksFired;
        expect(failureCount.load()).assertEqual(3);
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionWithErrorTest0800
     * @tc.number SUB_TASK_CALLBACKFUNCTIONWITHERROR_TEST_0800
     * @tc.desc   Verify onExecutionFailed does not fire when task is cancelled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskCallbackFunctionWithErrorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let failedCalled: boolean = false;
      let task: taskpool.Task = new taskpool.Task(delayTaskFunc, 5000.0);
      task.onExecutionFailed((e: Error) => {
        failedCalled = e instanceof Error || failedCalled;
      });
      let executePromise: Promise<Any> = taskpool.execute(task);
      try {
        await Utils.msSleep(100);
        taskpool.cancel(task);
        await Utils.msSleep(200);
        try {
          await executePromise;
        } catch (error) {
          // Cancellation rejects the execute promise; expected and safe to ignore here
        }
        expect(failedCalled).assertFalse();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionWithErrorTest0900
     * @tc.number SUB_TASK_CALLBACKFUNCTIONWITHERROR_TEST_0900
     * @tc.desc   Verify onExecutionFailed does not fire when task times out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskCallbackFunctionWithErrorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let failedCalled: boolean = false;
      let task: taskpool.Task = new taskpool.Task(delayTaskFunc, 5000.0);
      task.onExecutionFailed((e: Error) => {
        failedCalled = e instanceof Error || failedCalled;
      });
      let timeoutPromise: Promise<Any> = taskpool.execute(task, { timeout: 500 });
      // 等待超过 timeout，确认超时路径不会误触发 onExecutionFailed
      try {
        await Utils.msSleep(800);
        try {
          await timeoutPromise;
        } catch (error) {
          // Timeout rejects the execute promise; expected and safe to ignore here
        }
        expect(failedCalled).assertFalse();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskCallbackFunctionWithErrorTest1000
     * @tc.number SUB_TASK_CALLBACKFUNCTIONWITHERROR_TEST_1000
     * @tc.desc   Verify onExecutionFailed fires after sendData when task fails
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskCallbackFunctionWithErrorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let errorCallbackFired: boolean = false;
      let dataReceived: string = "";
      let task: taskpool.Task = new taskpool.Task(sendDataAndFail);
      task.onReceiveData((data: string) => {
        dataReceived = data;
      });
      task.onExecutionFailed((e: Error) => {
        errorCallbackFired = e instanceof Error;
      });
      try {
        await taskpool.execute(task);
      } catch (e) {
        }
      try {
        await Utils.msSleep(100);
        expect(dataReceived).assertEqual("progress data");
        expect(errorCallbackFired).assertTrue();
      } catch (error) {
        expect().assertFail();
      }
      done();
    })
  })
}
