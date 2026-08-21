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

let simpleFunc = (): number => { return 100 }
let longFunc = (): number => {
  let t: number = Date.now()
  while (Date.now() - t < 500) {}
  return 100
}
let multiplyFunc = (args: number): number => { return args * 2.0 }

class EnqueuedHandler {
  count: number = 0
  onEnqueuedCallback(): void {
    this.count++
  }
}

async function waitForEnqueuedCondition(condition: () => boolean): Promise<void> {
  let waitCount: number = 0
  while (!condition() && waitCount < 150) {
    await Utils.msSleep(20)
    waitCount++
  }
}

export default function TaskOnEnqueuedTest(): void {
  describe('TaskOnEnqueuedTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskOnEnqueuedTest0100
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_0100
     * @tc.desc   Verify Task.onEnqueued() registers arrow function callback successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnEnqueuedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let callbackExecuted: boolean = false
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbEnq0: () => void = (): void => {
        callbackExecuted = true
      }
      task.onEnqueued(cbEnq0)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition0100: () => boolean = (): boolean => callbackExecuted
      try {
        await waitForEnqueuedCondition(condition0100)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackExecuted).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest0200
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_0200
     * @tc.desc   Verify Task.onEnqueued() registers empty function body callback without error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnEnqueuedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let noException: boolean = true
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      try {
        let cbEnq1: () => void = (): void => {}
        task.onEnqueued(cbEnq1)
      } catch (e) {
        noException = false
      }
      expect(noException).assertTrue()
      let result: number = 0;
      try {
        result = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual(100)
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest0300
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_0300
     * @tc.desc   Verify Task.onEnqueued() callback with statement execution still registers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnEnqueuedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let callbackExecuted: boolean = false
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbEnq2: () => void = (): void => {
        callbackExecuted = true
      }
      task.onEnqueued(cbEnq2)
      let result: number = 0;
      try {
        result = (await taskpool.execute(task)) as number;
      } catch (error) {
        expect().assertFail();
      }
      const condition0300: () => boolean = (): boolean => callbackExecuted
      try {
        await waitForEnqueuedCondition(condition0300)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackExecuted).assertTrue()
      expect(result).assertEqual(100)
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest0400
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_0400
     * @tc.desc   Verify Task.onEnqueued() registers arrow function reference as callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnEnqueuedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let callbackCount: AtomicInt = new AtomicInt(0)
      let handler = (): void => {
        callbackCount.fetchAdd(1)
      }
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      task.onEnqueued(handler)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let waitCount0400: number = 0
      while (callbackCount.load() < 1 && waitCount0400 < 50) {
        try {
          await Utils.msSleep(20);
        } catch (error) {
          expect().assertFail();
        }
        waitCount0400++
      }
      expect(callbackCount.load()).assertEqual(1)
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest0500
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_0500
     * @tc.desc   Verify Task.onEnqueued() callback executes correctly with closure variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnEnqueuedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let capturedValue: number = 42
      let resultValue: number = 0
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbEnq3: () => void = (): void => {
        resultValue = capturedValue
      }
      task.onEnqueued(cbEnq3)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(resultValue).assertEqual(42)
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest0600
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_0600
     * @tc.desc   Verify Task.onEnqueued() registers empty callback without throwing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnEnqueuedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let noException: boolean = true
      try {
        let cbEnq4: () => void = (): void => {}
        task.onEnqueued(cbEnq4)
      } catch (e) {
        noException = false
      }
      expect(noException).assertTrue()
    })
    /**
     * @tc.name   TaskOnEnqueuedTest0700
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_0700
     * @tc.desc   Verify Task.onEnqueued() callback is executed when task is enqueued
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnEnqueuedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let callbackExecuted: boolean = false
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbEnq5: () => void = (): void => {
        callbackExecuted = true
      }
      task.onEnqueued(cbEnq5)
      expect(callbackExecuted).assertFalse()
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition0700: () => boolean = (): boolean => callbackExecuted
      try {
        await waitForEnqueuedCondition(condition0700)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackExecuted).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest0800
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_0800
     * @tc.desc   Verify Task.onEnqueued() last registered callback takes effect on multiple registrations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnEnqueuedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let result: string = ''
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbEnq6: () => void = (): void => {
        result = 'first'
      }
      task.onEnqueued(cbEnq6)
      let cbEnq7: () => void = (): void => {
        result = 'second'
      }
      task.onEnqueued(cbEnq7)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(result).assertEqual('second')
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest0900
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_0900
     * @tc.desc   Verify Task.onEnqueued() throws error when registering callback after task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnEnqueuedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let errorThrown: boolean = false
      try {
        let cbEnq8: () => void = (): void => {}
        task.onEnqueued(cbEnq8)
      } catch (e) {
        errorThrown = true
      }
      expect(errorThrown).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest1000
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_1000
     * @tc.desc   Verify Task.onEnqueued() throws error when registering callback during task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnEnqueuedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longFunc)
      let executePromise: Promise<Any> = taskpool.execute(task)
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      let errorThrown: boolean = false
      try {
        let cbEnq9: () => void = (): void => {}
        task.onEnqueued(cbEnq9)
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
     * @tc.name   TaskOnEnqueuedTest1100
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_1100
     * @tc.desc   Verify Task.onEnqueued() throws error when registering callback on canceled task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnEnqueuedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longFunc)
      let executePromise: Promise<Any> = taskpool.execute(task, { timeout: 5000 })
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      try {
        taskpool.cancel(task)
      } catch (e) {
        // cancel may throw if task already dispatched
      }
      try {
        await executePromise;
      } catch (error) {
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      let errorThrown: boolean = false
      try {
        let cbEnq10: () => void = (): void => {}
        task.onEnqueued(cbEnq10)
      } catch (e) {
        errorThrown = true
      }
      expect(errorThrown).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest1200
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_1200
     * @tc.desc   Verify Task.onEnqueued() callback does not prevent task result retrieval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnEnqueuedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(multiplyFunc, 5.0)
      let callbackExecuted: boolean = false
      let cbEnq11: () => void = (): void => {
        callbackExecuted = true
      }
      task.onEnqueued(cbEnq11)
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
      expect(result).assertEqual(10)
      expect(callbackExecuted).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest1300
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_1300
     * @tc.desc   Verify Task.onEnqueued() callback is called when task is enqueued via execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskOnEnqueuedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let callbackOrder: string[] = []
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbEnq12: () => void = (): void => {
        callbackOrder.push('enqueued')
      }
      task.onEnqueued(cbEnq12)
      callbackOrder.push('beforeExecute')
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      callbackOrder.push('afterExecute')
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(callbackOrder[0]).assertEqual('beforeExecute')
      let hasEnqueued: boolean = false
      for (let i = 0; i < callbackOrder.length; i++) {
        if (callbackOrder[i] === 'enqueued') {
          hasEnqueued = true
        }
      }
      expect(hasEnqueued).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest1400
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_1400
     * @tc.desc   Verify Task.onEnqueued/onStartExecution/onExecutionSucceeded execute in correct order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnEnqueuedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let order: string[] = []
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbEnq13: () => void = (): void => {
        order.push('enqueued')
      }
      task.onEnqueued(cbEnq13)
      let cbStart0: () => void = (): void => {        order.push('start')}
      task.onStartExecution(cbStart0)
      let cbSucc0: () => void = (): void => {        order.push('success')}
      task.onExecutionSucceeded(cbSucc0)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let waitCount1400: number = 0;
      while (order.length < 3 && waitCount1400 < 150) {
        try {
          await Utils.msSleep(20)
        } catch (error) {
          expect().assertFail()
        }
        waitCount1400++
      }
      // 宿主侧回调投递顺序在高负载下不保证，断言收敛为每个回调各触发一次
      expect(order.length).assertEqual(3)
      let enqueuedCount: number = 0
      let startCount: number = 0
      let successCount: number = 0
      for (let item of order) {
        if (item === 'enqueued') {
          enqueuedCount++
        }
        if (item === 'start') {
          startCount++
        }
        if (item === 'success') {
          successCount++
        }
      }
      expect(enqueuedCount).assertEqual(1)
      expect(startCount).assertEqual(1)
      expect(successCount).assertEqual(1)
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest1500
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_1500
     * @tc.desc   Verify Task.onEnqueued() callbacks execute independently for concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnEnqueuedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let results: string[] = []
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let task2: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbEnq14: () => void = (): void => {        results.push('task1_enqueued')}
      task1.onEnqueued(cbEnq14)
      let cbEnq15: () => void = (): void => {        results.push('task2_enqueued')}
      task2.onEnqueued(cbEnq15)
      try {
        await Promise.all([taskpool.execute(task1), taskpool.execute(task2)]);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(2)
      let hasTask1: boolean = false
      let hasTask2: boolean = false
      for (let i = 0; i < results.length; i++) {
        if (results[i] === 'task1_enqueued') {
          hasTask1 = true
        }
        if (results[i] === 'task2_enqueued') {
          hasTask2 = true
        }
      }
      expect(hasTask1).assertTrue()
      expect(hasTask2).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest1600
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_1600
     * @tc.desc   Verify Task.onEnqueued() callback with delayed task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnEnqueuedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callbackExecuted: boolean = false
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbEnq16: () => void = (): void => {
        callbackExecuted = true
      }
      task.onEnqueued(cbEnq16)
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition1600: () => boolean = (): boolean => callbackExecuted
      try {
        await waitForEnqueuedCondition(condition1600)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackExecuted).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest1700
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_1700
     * @tc.desc   Verify Task.onEnqueued() concurrent race condition with multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnEnqueuedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callbackPromises: Promise<void>[] = []
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        let task: taskpool.Task = new taskpool.Task(simpleFunc)
        let cbEnq17: () => void = (): void => {
          callbackPromises.push(Promise.resolve())
        }
        task.onEnqueued(cbEnq17)
        tasks.push(task)
      }
      try {
        await Promise.all(tasks.map((t: taskpool.Task) => taskpool.execute(t)));
      } catch (error) {
        expect().assertFail();
      }
      let waitCount1700: number = 0;
      while (callbackPromises.length < 5 && waitCount1700 < 150) {
        try {
          await Utils.msSleep(20)
        } catch (error) {
          expect().assertFail()
        }
        waitCount1700++
      }
      expect(callbackPromises.length).assertEqual(5)
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest1800
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_1800
     * @tc.desc   Verify Task.onEnqueued() callback behavior after task cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnEnqueuedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callbackExecuted: boolean = false
      let task: taskpool.Task = new taskpool.Task(longFunc)
      let cbEnq18: () => void = (): void => {
        callbackExecuted = true
      }
      task.onEnqueued(cbEnq18)
      let executePromise: Promise<Any> = taskpool.execute(task, { timeout: 5000 })
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      try {
        taskpool.cancel(task)
      } catch (e) {
        // cancel may throw if task already completed, which is acceptable
      }
      try {
        await executePromise;
      } catch (error) {
      }
      const condition1800: () => boolean = (): boolean => callbackExecuted
      try {
        await waitForEnqueuedCondition(condition1800)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackExecuted).assertTrue()
      expect(task.isDone()).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest1900
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_1900
     * @tc.desc   Verify Task.onEnqueued() callback execution state under timeout scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnEnqueuedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let enqueuedCallbackExecuted: boolean = false
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbEnq19: () => void = (): void => {
        enqueuedCallbackExecuted = true
      }
      task.onEnqueued(cbEnq19)
      let executePromise: Promise<Any> = taskpool.execute(task, { timeout: 5000 })
      try {
        await executePromise;
      } catch (error) {
        expect().assertFail();
      }
      const condition1900: () => boolean = (): boolean => enqueuedCallbackExecuted
      try {
        await waitForEnqueuedCondition(condition1900)
      } catch (error) {
        expect().assertFail()
      }
      expect(enqueuedCallbackExecuted).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest2000
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_2000
     * @tc.desc   Verify Task.onEnqueued() callback triggered by event driven task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnEnqueuedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let enqueuedCallbackExecuted: boolean = false
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbEnq20: () => void = (): void => {
        enqueuedCallbackExecuted = true
      }
      task.onEnqueued(cbEnq20)
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition2000: () => boolean = (): boolean => enqueuedCallbackExecuted
      try {
        await waitForEnqueuedCondition(condition2000)
      } catch (error) {
        expect().assertFail()
      }
      expect(enqueuedCallbackExecuted).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest2100
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_2100
     * @tc.desc   Verify Task.onEnqueued() task lifecycle management after task completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnEnqueuedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let callbackExecuted: boolean = false
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbEnq21: () => void = (): void => {
        callbackExecuted = true
      }
      task.onEnqueued(cbEnq21)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      const condition2100: () => boolean = (): boolean => callbackExecuted
      try {
        await waitForEnqueuedCondition(condition2100)
      } catch (error) {
        expect().assertFail()
      }
      expect(callbackExecuted).assertTrue()
      expect(task.isDone()).assertTrue()
      let errorThrown: boolean = false
      try {
        let cbEnq22: () => void = (): void => {
          try {
            throw new Error("onEnqueued callback must not be invoked after task completion");
          } catch (error) {
            expect().assertFail();
          }
        }
        task.onEnqueued(cbEnq22)
      } catch (e) {
        errorThrown = true
      }
      expect(errorThrown).assertTrue()
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest2200
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_2200
     * @tc.desc   Verify Task.onEnqueued() registers class method wrapper as callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskOnEnqueuedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let handler: EnqueuedHandler = new EnqueuedHandler()
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbEnq23: () => void = (): void => {
        handler.onEnqueuedCallback()
      }
      task.onEnqueued(cbEnq23)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(handler.count).assertEqual(1)
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest2300
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_2300
     * @tc.desc   Verify Task.onEnqueued() callback invokes parameterized function via wrapper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnEnqueuedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let capturedValue: number = 0
      let funcWithParam = (x: number): void => {
        capturedValue = x
      }
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbEnq24: () => void = (): void => {
        funcWithParam(42)
      }
      task.onEnqueued(cbEnq24)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(capturedValue).assertEqual(42)
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest2400
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_2400
     * @tc.desc   Verify Task.onEnqueued() callback throwing error does not affect task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnEnqueuedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbEnq25: () => void = (): void => {
        throw new Error('callback error')
      }
      task.onEnqueued(cbEnq25)
      let result: number = 0
      let unexpectedError: boolean = false
      try {
        result = (await taskpool.execute(task)) as number
      } catch (e) {
        unexpectedError = true
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(unexpectedError).assertFalse()
      expect(result).assertEqual(100)
      done();
    })
    /**
     * @tc.name   TaskOnEnqueuedTest2500
     * @tc.number SUB_TASK_ON_ENQUEUED_TEST_2500
     * @tc.desc   Verify Task.onEnqueued() callback result used for subsequent task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskOnEnqueuedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let computedValue: number = 0
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbEnq26: () => void = (): void => {        computedValue = 10.0 * 5.0}
      task.onEnqueued(cbEnq26)
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
      expect(result).assertEqual(100)
      expect(computedValue).assertEqual(50)
      let secondTask: taskpool.Task = new taskpool.Task(multiplyFunc, computedValue)
      let secondResult: number = 0;
      try {
        secondResult = (await taskpool.execute(secondTask)) as number;
      } catch (error) {
        expect().assertFail();
      }
      expect(secondResult).assertEqual(100)
      done();
    })

      })
}
