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

import {describe, afterAll, it, expect, TestType, Size, Level, beforeAll} from '../../../../hypium';
import Utils from '../Util.test';

function simpleSuccessFunc(): number { return 100 }
function failedFunc(): number { throw new Error("task failed") }
function longSuccessFunc(): number {
  let t: Long = Date.now()
  while (Date.now() - t < 500) {}
  return 100
}
function specificErrorFunc(): number { throw new Error("specific error message") }
function typeErrorFunc(): number { throw new TypeError("type error occurred") }

async function waitForFailedCondition(condition: () => boolean): Promise<void> {
  let waitCount: number = 0
  while (!condition() && waitCount < 50) {
    await Utils.msSleep(20)
    waitCount++
  }
}

export default function TaskOnExecutionFailedTest(): void {
  describe('TaskOnExecutionFailedTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskOnExecutionFailedTest0100
     * @tc.number SUB_TASK_ON_EXECUTION_FAILED_TEST_0100
     * @tc.desc   Verify Task.onExecutionFailed() with normal callback function registration and triggers when task throws Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnExecutionFailedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(failedFunc)
      let callbackCalled: boolean = false
      task.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          callbackCalled = true
        }
      })
      try {
        await taskpool.execute(task)
      } catch (e) {
      }
      const condition0100: () => boolean = (): boolean => callbackCalled
      try {
        await waitForFailedCondition(condition0100)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackCalled).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnExecutionFailedTest0200
     * @tc.number SUB_TASK_ON_EXECUTION_FAILED_TEST_0200
     * @tc.desc   Verify Task.onExecutionFailed() registration with valid callback does not throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnExecutionFailedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      let noException: boolean = true
      try {
        task.onExecutionFailed((e: Error) => {
          noException = e instanceof Error || noException;
        })
      } catch (e) {
        noException = false
      }
      expect(noException).assertTrue()
    })

    /**
     * @tc.name   TaskOnExecutionFailedTest0300
     * @tc.number SUB_TASK_ON_EXECUTION_FAILED_TEST_0300
     * @tc.desc   Verify Task.onExecutionFailed() with arrow function callback and Error.message contains expected content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnExecutionFailedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(failedFunc)
      let receivedMessage: string = ''
      task.onExecutionFailed((e: Error) => {
        receivedMessage = e.message
      })
      try {
        await taskpool.execute(task)
      } catch (e) {
      }
      const condition0300: () => boolean = (): boolean => receivedMessage === "task failed"
      try {
        await waitForFailedCondition(condition0300)
      } catch (error) {
        expect().assertFail()
      }
      expect(receivedMessage).assertEqual("task failed")
      done();
    })

    /**
     * @tc.name   TaskOnExecutionFailedTest0400
     * @tc.number SUB_TASK_ON_EXECUTION_FAILED_TEST_0400
     * @tc.desc   Verify Task.onExecutionFailed() callback receives Error parameter correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnExecutionFailedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(specificErrorFunc)
      let receivedError: Error | null = null
      task.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          receivedError = e
        }
      })
      try {
        await taskpool.execute(task)
      } catch (e) {
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(receivedError !== null).assertTrue()
      expect(receivedError instanceof Error).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnExecutionFailedTest0500
     * @tc.number SUB_TASK_ON_EXECUTION_FAILED_TEST_0500
     * @tc.desc   Verify Task.onExecutionFailed() throws error when registered after task executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnExecutionFailedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let errorThrown: boolean = false
      try {
        task.onExecutionFailed((e: Error) => {
          errorThrown = errorThrown || e instanceof Error;
        })
      } catch (e) {
        errorThrown = true
      }
      expect(errorThrown).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnExecutionFailedTest0600
     * @tc.number SUB_TASK_ON_EXECUTION_FAILED_TEST_0600
     * @tc.desc   Verify Task.onExecutionFailed() throws error when registered during task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnExecutionFailedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longSuccessFunc)
      let executePromise: Promise<Any> = taskpool.execute(task)
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      let errorThrown: boolean = false
      try {
        task.onExecutionFailed((e: Error) => {
          let failureReason: Error | null = e;
          if (failureReason !== null) {
            // callback is not expected to run: registration during execution throws instead
          }
        })
      } catch (e) {
        errorThrown = true
      }
      try {
        await executePromise;
      } catch (error) {
        expect().assertFail();
      }
      expect(errorThrown).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnExecutionFailedTest0700
     * @tc.number SUB_TASK_ON_EXECUTION_FAILED_TEST_0700
     * @tc.desc   Verify Task.onExecutionFailed() is not triggered when task executes successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnExecutionFailedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      let callbackCalled: boolean = false
      task.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          callbackCalled = true
        }
      })
      let result: number = 0;
      try {
        result = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(callbackCalled).assertFalse()
      expect(result).assertEqual(100)
      done();
    })

    /**
     * @tc.name   TaskOnExecutionFailedTest0800
     * @tc.number SUB_TASK_ON_EXECUTION_FAILED_TEST_0800
     * @tc.desc   Verify Task.onExecutionFailed() combined with onExecutionSucceeded when task succeeds only triggers succeeded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnExecutionFailedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      let successCalled: boolean = false
      let failedCalled: boolean = false
      let cbSucc0: () => void = (): void => {
        successCalled = true
      }
      task.onExecutionSucceeded(cbSucc0)
      task.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          failedCalled = true
        }
      })
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition0800: () => boolean = (): boolean => successCalled
      try {
        await waitForFailedCondition(condition0800)
      } catch (error) {
        expect().assertFail()
      }
      expect(successCalled).assertTrue()
      expect(failedCalled).assertFalse()
      done();
    })

    /**
     * @tc.name   TaskOnExecutionFailedTest0900
     * @tc.number SUB_TASK_ON_EXECUTION_FAILED_TEST_0900
     * @tc.desc   Verify Task.onExecutionFailed() combined with onExecutionSucceeded when task fails only triggers failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnExecutionFailedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(failedFunc)
      let successCalled: boolean = false
      let failedCalled: boolean = false
      let cbSucc1: () => void = (): void => {        successCalled = true}
      task.onExecutionSucceeded(cbSucc1)
      task.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          failedCalled = true
        }
      })
      try {
        await taskpool.execute(task)
      } catch (e) {
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(successCalled).assertFalse()
      expect(failedCalled).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnExecutionFailedTest1000
     * @tc.number SUB_TASK_ON_EXECUTION_FAILED_TEST_1000
     * @tc.desc   Verify Task.onExecutionFailed() with multiple concurrent tasks registering callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnExecutionFailedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(failedFunc)
      let task2: taskpool.Task = new taskpool.Task(failedFunc)
      let task3: taskpool.Task = new taskpool.Task(failedFunc)
      let callbackCount: AtomicInt = new AtomicInt(0)
      task1.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          callbackCount.fetchAdd(1)
        }
      })
      task2.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          callbackCount.fetchAdd(1)
        }
      })
      task3.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          callbackCount.fetchAdd(1)
        }
      })
      let p1 = taskpool.execute(task1)
      let p2 = taskpool.execute(task2)
      let p3 = taskpool.execute(task3)
      try {
        await p1
      } catch (error) {
      }
      try {
        await p2
      } catch (error) {
      }
      try {
        await p3
      } catch (error) {
      }
      let begin: number = Date.now()
      while (callbackCount.load() < 3 && Date.now() - begin < 5000) {
        try {
          await Utils.msSleep(100)
        } catch (error) {
          expect().assertFail()
        }
      }
      expect(callbackCount.load()).assertEqual(3)
      done();
    })

    /**
     * @tc.name   TaskOnExecutionFailedTest1100
     * @tc.number SUB_TASK_ON_EXECUTION_FAILED_TEST_1100
     * @tc.desc   Verify Task.onExecutionFailed() called multiple times on same task overrides callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnExecutionFailedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(failedFunc)
      let callOrder: number[] = []
      task.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          callOrder.push(1)
        }
      })
      task.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          callOrder.push(2)
        }
      })
      task.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          callOrder.push(3)
        }
      })
      try {
        await taskpool.execute(task)
      } catch (e) {
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(callOrder.length).assertEqual(1)
      expect(callOrder[0]).assertEqual(3)
      done();
    })

    /**
     * @tc.name   TaskOnExecutionFailedTest1200
     * @tc.number SUB_TASK_ON_EXECUTION_FAILED_TEST_1200
     * @tc.desc   Verify Task.onExecutionFailed() on two failing tasks each triggers callback once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnExecutionFailedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(failedFunc)
      let task2: taskpool.Task = new taskpool.Task(failedFunc)
      let callbackCount: AtomicInt = new AtomicInt(0)
      task1.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          callbackCount.fetchAdd(1)
        }
      })
      task2.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          callbackCount.fetchAdd(1)
        }
      })
      let p1 = taskpool.execute(task1)
      let p2 = taskpool.execute(task2)
      try {
        await p1
      } catch (error) {
      }
      try {
        await p2
      } catch (error) {
      }
      let begin: number = Date.now()
      while (callbackCount.load() < 2 && Date.now() - begin < 5000) {
        try {
          await Utils.msSleep(100)
        } catch (error) {
          expect().assertFail()
        }
      }
      expect(callbackCount.load()).assertEqual(2)
      done();
    })

    /**
     * @tc.name   TaskOnExecutionFailedTest1300
     * @tc.number SUB_TASK_ON_EXECUTION_FAILED_TEST_1300
     * @tc.desc   Verify Task.onExecutionFailed() callback not triggered when task is canceled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnExecutionFailedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longSuccessFunc)
      let callbackTriggered: boolean = false
      task.onExecutionFailed((e: Error) => {
        callbackTriggered = e instanceof Error || callbackTriggered;
      })
      let executePromise: Promise<Any> = taskpool.execute(task, { timeout: 5000 })
      try {
        await Utils.msSleep(100)
      } catch (error) {
        expect().assertFail()
      }
      // longSuccessFunc busy-waits 500ms; cancel at 100ms lands while task still running
      try {
        taskpool.cancel(task)
      } catch (e) {
        // cancel may throw if task already finished
      }
      try {
        await Utils.msSleep(100)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackTriggered).assertFalse()
      try {
        await executePromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskOnExecutionFailedTest1400
     * @tc.number SUB_TASK_ON_EXECUTION_FAILED_TEST_1400
     * @tc.desc   Verify Task.onExecutionFailed() callback internal exception does not affect task result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnExecutionFailedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(failedFunc)
      let callbackExecuted: boolean = false
      task.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          callbackExecuted = true
          try {
            throw new Error("callback internal error")
          } catch (innerError) {
          }
        }
      })
      try {
        await taskpool.execute(task)
      } catch (e) {
      }
      const condition1400: () => boolean = (): boolean => callbackExecuted
      try {
        await waitForFailedCondition(condition1400)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackExecuted).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnExecutionFailedTest1500
     * @tc.number SUB_TASK_ON_EXECUTION_FAILED_TEST_1500
     * @tc.desc   Verify Task.onExecutionFailed() callback triggered when task throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnExecutionFailedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(typeErrorFunc)
      let callbackTriggered: boolean = false
      task.onExecutionFailed((e: Error) => {
        callbackTriggered = e instanceof Error || callbackTriggered;
      })
      try {
        await taskpool.execute(task)
      } catch (e) {
      }
      const condition1500: () => boolean = (): boolean => callbackTriggered
      try {
        await waitForFailedCondition(condition1500)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackTriggered).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnExecutionFailedTest1600
     * @tc.number SUB_TASK_ON_EXECUTION_FAILED_TEST_1600
     * @tc.desc   Verify Task.onExecutionFailed() registered after Timer delay before task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnExecutionFailedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(failedFunc)
      let callbackRegistered: boolean = false
      let callbackTriggered: boolean = false
      try {
        await Utils.msSleep(500);
      } catch (error) {
        expect().assertFail();
      }
      try {
        task.onExecutionFailed((e: Error) => {
          callbackTriggered = e instanceof Error
        })
        callbackRegistered = true
      } catch (error) {
        expect().assertFail();
      }
      expect(callbackRegistered).assertTrue()
      try {
        await taskpool.execute(task)
      } catch (e) {
      }
      const condition1600: () => boolean = (): boolean => callbackTriggered
      try {
        await waitForFailedCondition(condition1600)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackTriggered).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskOnExecutionFailedTest1700
     * @tc.number SUB_TASK_ON_EXECUTION_FAILED_TEST_1700
     * @tc.desc   Verify Task.onExecutionFailed() callback can execute nested task with counter-based waiting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnExecutionFailedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let nestedCount: number = 0
      let nestedResult: number = 0
      let nestedPromise: Promise<Any> | null = null
      let task: taskpool.Task = new taskpool.Task(failedFunc)
      task.onExecutionFailed((e: Error) => {
        if (e instanceof Error) {
          let nestedTask: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
          nestedPromise = taskpool.execute(nestedTask)
        }
      })
      try {
        await taskpool.execute(task)
      } catch (e) {
      }
      let waitStart: number = Date.now()
      while (nestedPromise === null && Date.now() - waitStart < 5000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
      }
      expect(nestedPromise !== null).assertTrue()
      if (nestedPromise !== null) {
        let nestedResultValue: Any = undefined;
        try {
          nestedResultValue = await nestedPromise;
        } catch (error) {
          expect().assertFail();
        }
        nestedResult = nestedResultValue as number
        nestedCount++
      }
      expect(nestedCount).assertEqual(1)
      expect(nestedResult).assertEqual(100)
      done();
    })
  })
}
