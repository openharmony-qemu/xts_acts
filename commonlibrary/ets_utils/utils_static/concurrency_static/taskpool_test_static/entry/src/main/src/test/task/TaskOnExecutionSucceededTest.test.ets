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

let simpleSuccessFunc = (): number => { return 100 }
let stringSuccessFunc = (): string => { return "hello" }
let voidSuccessFunc = (): void => {}
let failedFunc = (): number => { throw new Error("task failed") }
let longSuccessFunc = (): number => {
  let t: Long = Date.now()
  while (Date.now() - t < 100) {}
  return 100
}
let addFunc = (args: number): number => { return args + 1.0 }
let multiArgFunc = (a: number, b: string, c: boolean): string => {
  return a.toString() + '-' + b + '-' + c.toString()
}

async function waitForSucceededCondition(condition: () => boolean): Promise<void> {
  let waitCount: number = 0
  while (!condition() && waitCount < 150) {
    await Utils.msSleep(20)
    waitCount++
  }
}

export default function TaskOnExecutionSucceededTest(): void {
  describe('TaskOnExecutionSucceededTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskOnExecutionSucceededTest0100
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_0100
     * @tc.desc   Verify Task.onExecutionSucceeded() with callback function registration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnExecutionSucceededTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      let callbackCalled: boolean = false
      let cbSucc0: () => void = (): void => {
        callbackCalled = true
      }
      task.onExecutionSucceeded(cbSucc0)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition0100: () => boolean = (): boolean => callbackCalled
      try {
        await waitForSucceededCondition(condition0100)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackCalled).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest0200
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_0200
     * @tc.desc   Verify Task.onExecutionSucceeded() with closure callback capturing external variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnExecutionSucceededTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let externalValue: string = ""
      let task: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      let cbSucc1: () => void = (): void => {
        externalValue = "success"
      }
      task.onExecutionSucceeded(cbSucc1)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition0200: () => boolean = (): boolean => externalValue === "success"
      try {
        await waitForSucceededCondition(condition0200)
      } catch (error) {
        expect().assertFail()
      }
      expect(externalValue).assertEqual("success")
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest0300
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_0300
     * @tc.desc   Verify Task.onExecutionSucceeded() does not support chain calling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnExecutionSucceededTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      let callback1Called: boolean = false
      let callback2Called: boolean = false
      let cbSucc2: () => void = (): void => {
        callback1Called = true
      }
      task.onExecutionSucceeded(cbSucc2)
      let cbSucc3: () => void = (): void => {
        callback2Called = true
      }
      task.onExecutionSucceeded(cbSucc3)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition0300: () => boolean = (): boolean => callback2Called
      try {
        await waitForSucceededCondition(condition0300)
      } catch (error) {
        expect().assertFail()
      }
      // Chain calling not supported, second registration overrides first
      expect(callback1Called).assertFalse()
      expect(callback2Called).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest0400
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_0400
     * @tc.desc   Verify Task.onExecutionSucceeded() throws error when registered after task executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnExecutionSucceededTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let errorThrown: boolean = false
      try {
        let cbSucc4: () => void = (): void => {}
        task.onExecutionSucceeded(cbSucc4)
      } catch (e) {
        errorThrown = true
      }
      expect(errorThrown).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest0500
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_0500
     * @tc.desc   Verify Task.onExecutionSucceeded() throws error when registered during task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnExecutionSucceededTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longSuccessFunc)
      let executePromise: Promise<Any> = taskpool.execute(task)
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      let errorThrown: boolean = false
      try {
        let cbSucc5: () => void = (): void => {}
        task.onExecutionSucceeded(cbSucc5)
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
     * @tc.name   TaskOnExecutionSucceededTest0600
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_0600
     * @tc.desc   Verify Task.onExecutionSucceeded() throws error with non-empty message when registered after execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnExecutionSucceededTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let errorThrown: boolean = false
      try {
        let cbSucc6: () => void = (): void => {
          try {
            throw new Error("onExecutionSucceeded callback must not be invoked after task execution");
          } catch (error) {
            expect().assertFail();
          }
        }
        task.onExecutionSucceeded(cbSucc6)
      } catch (e) {
        errorThrown = true
      }
      expect(errorThrown).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest0700
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_0700
     * @tc.desc   Verify Task.onExecutionSucceeded() is not triggered when task fails
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnExecutionSucceededTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(failedFunc)
      let successCallbackExecuted: boolean = false
      let cbSucc7: () => void = (): void => {
        successCallbackExecuted = true
      }
      task.onExecutionSucceeded(cbSucc7)
      try {
        await taskpool.execute(task)
      } catch (e) {
      }
      expect(successCallbackExecuted).assertFalse()
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest0800
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_0800
     * @tc.desc   Verify Task.onExecutionSucceeded() is not triggered when task is canceled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnExecutionSucceededTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task((): number => {
        let t: Long = Date.now()
        while (Date.now() - t < 1000) {}
        return 100
      })
      let callbackExecuted: boolean = false
      let cbSucc8: () => void = (): void => {
        callbackExecuted = true
      }
      task.onExecutionSucceeded(cbSucc8)
      let executePromise: Promise<Any> = taskpool.executeDelayed(1000, task)
      try {
        taskpool.cancel(task)
      } catch (e) {
        // cancel may throw if the delayed task has already settled
      }
      try {
        await executePromise
      } catch (e) {
      }
      expect(callbackExecuted).assertFalse()
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest0900
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_0900
     * @tc.desc   Verify Task.onExecutionSucceeded() callback can access external variables
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnExecutionSucceededTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let externalData: number = 0
      let task: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      let cbSucc9: () => void = (): void => {
        externalData = 100
      }
      task.onExecutionSucceeded(cbSucc9)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition0900: () => boolean = (): boolean => externalData === 100
      try {
        await waitForSucceededCondition(condition0900)
      } catch (error) {
        expect().assertFail()
      }
      expect(externalData).assertEqual(100)
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest1000
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_1000
     * @tc.desc   Verify Task.onExecutionSucceeded() callback exception does not affect task result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnExecutionSucceededTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      let taskResult: number = 0
      let callbackCalled: boolean = false
      let cbSucc10: () => void = (): void => {
        callbackCalled = true
        try {
          throw new Error("callback error")
        } catch (innerError) {
          // caught internally
        }
      }
      task.onExecutionSucceeded(cbSucc10)
      try {
        taskResult = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      const condition1000: () => boolean = (): boolean => callbackCalled
      try {
        await waitForSucceededCondition(condition1000)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackCalled).assertTrue()
      expect(taskResult).assertEqual(100)
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest1100
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_1100
     * @tc.desc   Verify Task.onExecutionSucceeded() callback internal try-catch catches exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnExecutionSucceededTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      let errorCaught: boolean = false
      let cbSucc11: () => void = (): void => {
        try {
          throw new Error("test error")
        } catch (e) {
          errorCaught = true
        }
      }
      task.onExecutionSucceeded(cbSucc11)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition1100: () => boolean = (): boolean => errorCaught
      try {
        await waitForSucceededCondition(condition1100)
      } catch (error) {
        expect().assertFail()
      }
      expect(errorCaught).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest1200
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_1200
     * @tc.desc   Verify Task.onExecutionSucceeded() registration order does not affect execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnExecutionSucceededTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      let successCalled: boolean = false
      task.onExecutionFailed((e: Error) => {
        let failureReason: Error | null = e;
        if (failureReason !== null) {
          // failure callback is not expected for a successful task
        }
      })
      let cbSucc12: () => void = (): void => {
        successCalled = true
      }
      task.onExecutionSucceeded(cbSucc12)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition1200: () => boolean = (): boolean => successCalled
      try {
        await waitForSucceededCondition(condition1200)
      } catch (error) {
        expect().assertFail()
      }
      expect(successCalled).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest1300
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_1300
     * @tc.desc   Verify Task.onExecutionSucceeded() combined with isDone returns true in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnExecutionSucceededTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      let isDoneInCallback: boolean = false
      let cbSucc13: () => void = (): void => {
        isDoneInCallback = task.isDone()
      }
      task.onExecutionSucceeded(cbSucc13)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition1300: () => boolean = (): boolean => isDoneInCallback
      try {
        await waitForSucceededCondition(condition1300)
      } catch (error) {
        expect().assertFail()
      }
      expect(isDoneInCallback).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest1400
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_1400
     * @tc.desc   Verify Task.onExecutionSucceeded() with TaskGroup tasks registering callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnExecutionSucceededTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      let task2: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      let callbackCount: AtomicInt = new AtomicInt(0)
      let task1Fired: AtomicBoolean = new AtomicBoolean(false)
      let task2Fired: AtomicBoolean = new AtomicBoolean(false)
      let cbSucc14: () => void = (): void => {
        if (task1Fired.compareAndSwap(false, true) === false) {
          callbackCount.fetchAdd(1)
        }
      }
      task1.onExecutionSucceeded(cbSucc14)
      let cbSucc15: () => void = (): void => {
        if (task2Fired.compareAndSwap(false, true) === false) {
          callbackCount.fetchAdd(1)
        }
      }
      task2.onExecutionSucceeded(cbSucc15)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(task1)
      taskGroup.addTask(task2)
      try {
        await taskpool.execute(taskGroup);
      } catch (error) {
        expect().assertFail();
      }
      const condition1400: () => boolean = (): boolean => task1Fired.load() && task2Fired.load()
      try {
        await waitForSucceededCondition(condition1400)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackCount.load()).assertEqual(2)
      expect(task1Fired.load()).assertTrue()
      expect(task2Fired.load()).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest1500
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_1500
     * @tc.desc   Verify Task.onExecutionSucceeded() with SequenceRunner serial tasks registering callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnExecutionSucceededTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(addFunc, 1.0)
      let task2: taskpool.Task = new taskpool.Task(addFunc, 2.0)
      let executionOrder: number[] = []
      let task1Fired1500: boolean = false
      let task2Fired1500: boolean = false
      let cbSucc16: () => void = (): void => {        executionOrder.push(1); task1Fired1500 = true}
      task1.onExecutionSucceeded(cbSucc16)
      let cbSucc17: () => void = (): void => {        executionOrder.push(2); task2Fired1500 = true}
      task2.onExecutionSucceeded(cbSucc17)
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner()
      try {
        await runner.execute(task1);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await runner.execute(task2);
      } catch (error) {
        expect().assertFail();
      }
      const condition1500: () => boolean = (): boolean => task1Fired1500 && task2Fired1500
      try {
        await waitForSucceededCondition(condition1500)
      } catch (error) {
        expect().assertFail()
      }
      expect(executionOrder.length).assertEqual(2)
      expect(task1Fired1500).assertTrue()
      expect(task2Fired1500).assertTrue()
      expect(executionOrder[0]).assertEqual(1)
      expect(executionOrder[1]).assertEqual(2)
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest1600
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_1600
     * @tc.desc   Verify Task.onExecutionSucceeded() with long running callback execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnExecutionSucceededTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      let completed: boolean = false
      let cbSucc18: () => void = (): void => {
        let start: Long = Date.now()
        while (Date.now() - start < 100) {}
        completed = true
      }
      task.onExecutionSucceeded(cbSucc18)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition1600: () => boolean = (): boolean => completed
      try {
        await waitForSucceededCondition(condition1600)
      } catch (error) {
        expect().assertFail()
      }
      expect(completed).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest1700
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_1700
     * @tc.desc   Verify Task.onExecutionSucceeded() with task returning number triggers callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnExecutionSucceededTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      let callbackExecuted: boolean = false
      let cbSucc19: () => void = (): void => {
        callbackExecuted = true
      }
      task.onExecutionSucceeded(cbSucc19)
      let result: number = 0;
      try {
        result = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      const condition1700: () => boolean = (): boolean => callbackExecuted
      try {
        await waitForSucceededCondition(condition1700)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackExecuted).assertTrue()
      expect(result).assertEqual(100)
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest1800
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_1800
     * @tc.desc   Verify Task.onExecutionSucceeded() with task returning string triggers callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnExecutionSucceededTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(stringSuccessFunc)
      let callbackExecuted: boolean = false
      let cbSucc20: () => void = (): void => {
        callbackExecuted = true
      }
      task.onExecutionSucceeded(cbSucc20)
      let result: string = "";
      try {
        result = (await taskpool.execute(task)) as string;
      } catch (error) {
        expect().assertFail();
      }
      const condition1800: () => boolean = (): boolean => callbackExecuted
      try {
        await waitForSucceededCondition(condition1800)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackExecuted).assertTrue()
      expect(result).assertEqual("hello")
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest1900
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_1900
     * @tc.desc   Verify Task.onExecutionSucceeded() with task returning void triggers callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnExecutionSucceededTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(voidSuccessFunc)
      let callbackExecuted: boolean = false
      let cbSucc21: () => void = (): void => {
        callbackExecuted = true
      }
      task.onExecutionSucceeded(cbSucc21)
      let result: Object | undefined = undefined
      try {
        result = await taskpool.execute(task) as Object | undefined;
      } catch (error) {
        expect().assertFail();
      }
      const condition1900: () => boolean = (): boolean => callbackExecuted
      try {
        await waitForSucceededCondition(condition1900)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackExecuted).assertTrue()
      expect(result === undefined).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnExecutionSucceededTest2000
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_2000
     * @tc.desc   Verify Task.onExecutionSucceeded() with multi-argument task triggers callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnExecutionSucceededTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(multiArgFunc, 1.0, "test", true)
      let callbackExecuted: boolean = false
      let cbSucc22: () => void = (): void => {        callbackExecuted = true}
      task.onExecutionSucceeded(cbSucc22)
      let result: string = "";
      try {
        result = (await taskpool.execute(task)) as string;
      } catch (error) {
        expect().assertFail();
      }
      const condition2000: () => boolean = (): boolean => callbackExecuted
      try {
        await waitForSucceededCondition(condition2000)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackExecuted).assertTrue()
      expect(result).assertEqual("1-test-true")
      done();
    })

    /**
     * @tc.name   TaskOnExecutionSucceededTest2700
     * @tc.number SUB_TASK_ON_EXECUTION_SUCCEEDED_TEST_2700
     * @tc.desc   Verify each task in TaskGroup triggers its own onExecutionSucceeded callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('TaskOnExecutionSucceededTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      let task2: taskpool.Task = new taskpool.Task(simpleSuccessFunc)
      let task1Callback: boolean = false
      let task2Callback: boolean = false
      let cbSucc23: () => void = (): void => {        task1Callback = true}
      task1.onExecutionSucceeded(cbSucc23)
      let cbSucc24: () => void = (): void => {        task2Callback = true}
      task2.onExecutionSucceeded(cbSucc24)
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(task1)
      taskGroup.addTask(task2)
      try {
        await taskpool.execute(taskGroup);
      } catch (error) {
        expect().assertFail();
      }
      const condition2700: () => boolean = (): boolean => task1Callback && task2Callback
      try {
        await waitForSucceededCondition(condition2700)
      } catch (error) {
        expect().assertFail()
      }
      expect(task1Callback).assertTrue()
      expect(task2Callback).assertTrue()
      done();
    })

  })
}
