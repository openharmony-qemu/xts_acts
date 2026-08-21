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

let simpleFunc = (): number => { return 100 }
let isDoneLongFunc = (): number => {
  let t: number = Date.now()
  while (Date.now() - t < 3000) {}
  return 100
}
let longFunc = (): number => {
  let t: number = Date.now()
  while (Date.now() - t < 150) {}
  return 100
}
let failedFunc = (): number => { throw new Error("task failed") }
let quickFunc = (): number => { return 1 }
let taskFunc = (args: number): number => {
  let t: number = Date.now()
  while (Date.now() - t < args) {}
  return args
}
let multiplyFunc = (args: number): number => { return args * 2.0 }
let retryableFunc = (shouldFail: boolean): number => {
  if (shouldFail) {
    throw new Error("task failed")
  }
  return 100
}
let failedWithMsgFunc = (): number => { throw new Error("Task execution failed due to timeout") }

export default function TaskIsDoneTest(): void {
  describe('TaskIsDoneTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})

    /**
     * @tc.name   TaskIsDoneTest0100
     * @tc.number SUB_TASK_IS_DONE_TEST_0100
     * @tc.desc   Verify Task.isDone() returns true after task execution completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsDoneTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(task.isDone()).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest0200
     * @tc.number SUB_TASK_IS_DONE_TEST_0200
     * @tc.desc   Verify Task.isDone() returns true after task is canceled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskIsDoneTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longFunc)
      let executePromise: Promise<Any> = taskpool.execute(task)
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      let cancelThrew0300: boolean = false
      try {
        taskpool.cancel(task)
      } catch (e) {
        cancelThrew0300 = true
      }
      expect(cancelThrew0300).assertFalse()
      try {
        await Utils.msSleep(300);
      } catch (error) {
        expect().assertFail();
      }
      expect(task.isDone()).assertTrue()
      try {
        await executePromise;
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest0300
     * @tc.number SUB_TASK_IS_DONE_TEST_0300
     * @tc.desc   Verify Task.isDone() returns false when task is not executed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskIsDoneTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      expect(task.isDone()).assertFalse()
    })

    /**
     * @tc.name   TaskIsDoneTest0400
     * @tc.number SUB_TASK_IS_DONE_TEST_0400
     * @tc.desc   Verify Task.isDone() returns false when task is running
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsDoneTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // 3000ms 任务 + RUNNING 轮询后立即断言（150ms 短任务下宿主 msSleep 超睡会导致任务先完成）
      let task: taskpool.Task = new taskpool.Task(isDoneLongFunc)
      let executePromise: Promise<Any> = taskpool.execute(task)
      let running0400: boolean = false
      let begin0400: number = Date.now()
      while (!running0400 && Date.now() - begin0400 < 10000) {
        try {
          let poolInfo0400: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of poolInfo0400.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
              running0400 = true
            }
          }
          if (!running0400) {
            await Utils.msSleep(20);
          }
        } catch (error) {
          expect().assertFail();
        }
      }
      expect(running0400).assertTrue()
      expect(task.isDone()).assertFalse()
      try {
        await executePromise;
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest0500
     * @tc.number SUB_TASK_IS_DONE_TEST_0500
     * @tc.desc   Verify Task.isDone() returns true after task execution fails
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsDoneTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(failedFunc)
      let errorThrown: boolean = false
      try {
        await taskpool.execute(task)
      } catch (e) {
        errorThrown = true
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(errorThrown).assertTrue()
      expect(task.isDone()).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest0600
     * @tc.number SUB_TASK_IS_DONE_TEST_0600
     * @tc.desc   Verify Task.isDone() state switches quickly for quick execution task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsDoneTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(quickFunc)
      expect(task.isDone()).assertFalse()
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      expect(task.isDone()).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest0700
     * @tc.number SUB_TASK_IS_DONE_TEST_0700
     * @tc.desc   Verify Task.isDone() returns consistent value on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskIsDoneTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      expect(task.isDone()).assertFalse()
      expect(task.isDone()).assertFalse()
      expect(task.isDone()).assertFalse()
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
      expect(task.isDone()).assertTrue()
      expect(task.isDone()).assertTrue()
      expect(task.isDone()).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest0800
     * @tc.number SUB_TASK_IS_DONE_TEST_0800
     * @tc.desc   Verify Task.isDone() does not throw exception when called before execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskIsDoneTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let noException: boolean = true
      try {
        let result: boolean = task.isDone()
        expect(result).assertFalse()
      } catch (e) {
        noException = false
      }
      expect(noException).assertTrue()
    })

    /**
     * @tc.name   TaskIsDoneTest0900
     * @tc.number SUB_TASK_IS_DONE_TEST_0900
     * @tc.desc   Verify Task.isDone() does not throw exception when called during execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsDoneTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longFunc)
      let executePromise: Promise<Any> = taskpool.execute(task)
      let noException: boolean = true
      try {
        await Utils.msSleep(50)
        let result: boolean = task.isDone()
        // longFunc busy-waits 150ms; sampled at 50ms the task must still be running
        expect(result).assertFalse()
      } catch (e) {
        noException = false
      }
      expect(noException).assertTrue()
      try {
        await executePromise;
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest1000
     * @tc.number SUB_TASK_IS_DONE_TEST_1000
     * @tc.desc   Verify Task.isDone() does not throw exception when called after execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskIsDoneTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let noException: boolean = true
      try {
        let result: boolean = task.isDone()
        expect(result).assertTrue()
      } catch (e) {
        noException = false
      }
      expect(noException).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest1100
     * @tc.number SUB_TASK_IS_DONE_TEST_1100
     * @tc.desc   Verify Task.isDone() does not throw exception when called after task fails
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsDoneTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(failedFunc)
      let errorThrown1400: boolean = false
      try {
        await taskpool.execute(task)
      } catch (e) {
        errorThrown1400 = true
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(errorThrown1400).assertTrue()
      let noException: boolean = true
      try {
        let result: boolean = task.isDone()
        expect(result).assertTrue()
      } catch (e) {
        noException = false
      }
      expect(noException).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest1200
     * @tc.number SUB_TASK_IS_DONE_TEST_1200
     * @tc.desc   Verify Task.isDone() 100 sequential calls return consistent false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskIsDoneTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let results: boolean[] = []
      for (let i = 0; i < 100; i++) {
        results.push(task.isDone())
      }
      let allFalse: boolean = true
      for (let i = 0; i < results.length; i++) {
        if (results[i] !== false) {
          allFalse = false
          break
        }
      }
      expect(allFalse).assertTrue()
    })

    /**
     * @tc.name   TaskIsDoneTest1300
     * @tc.number SUB_TASK_IS_DONE_TEST_1300
     * @tc.desc   Verify Task.isDone() returns true in onExecutionSucceeded callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsDoneTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let isDoneInCallback: boolean = false
      let cbSucc0: () => void = (): void => {
        isDoneInCallback = task.isDone()
      }
      task.onExecutionSucceeded(cbSucc0)
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
      expect(isDoneInCallback).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest1400
     * @tc.number SUB_TASK_IS_DONE_TEST_1400
     * @tc.desc   Verify Task.isDone() returns true with and without callback registered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskIsDoneTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleFunc)
      let callback1Executed: boolean = false
      let cbSucc1: () => void = (): void => {        callback1Executed = true}
      task1.onExecutionSucceeded(cbSucc1)
      try {
        await taskpool.execute(task1);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(task1.isDone()).assertTrue()
      expect(callback1Executed).assertTrue()

      let task2: taskpool.Task = new taskpool.Task(simpleFunc)
      try {
        await taskpool.execute(task2);
      } catch (error) {
        expect().assertFail();
      }
      expect(task2.isDone()).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest1500
     * @tc.number SUB_TASK_IS_DONE_TEST_1500
     * @tc.desc   Verify Task.isDone() returns true on multiple calls within onExecutionSucceeded callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskIsDoneTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let callCount: AtomicInt = new AtomicInt(0)
      let cbSucc2: () => void = (): void => {
        callCount.fetchAdd(1)
        expect(task.isDone()).assertTrue()
        expect(task.isDone()).assertTrue()
        expect(task.isDone()).assertTrue()
      }
      task.onExecutionSucceeded(cbSucc2)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let waitCount1500: number = 0
      while (callCount.load() < 1 && waitCount1500 < 50) {
        try {
          await Utils.msSleep(20);
        } catch (error) {
          expect().assertFail();
        }
        waitCount1500++
      }
      expect(callCount.load()).assertEqual(1)
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest1600
     * @tc.number SUB_TASK_IS_DONE_TEST_1600
     * @tc.desc   Verify Task.isDone() returns true in onExecutionFailed callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsDoneTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(failedFunc)
      let callbackExecuted: boolean = false
      task.onExecutionFailed((e: Error) => {
        callbackExecuted = e instanceof Error
      })
      let errorThrown2200: boolean = false
      try {
        await taskpool.execute(task)
      } catch (e) {
        errorThrown2200 = true
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(errorThrown2200).assertTrue()
      expect(task.isDone()).assertTrue()
      expect(callbackExecuted).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest1700
     * @tc.number SUB_TASK_IS_DONE_TEST_1700
     * @tc.desc   Verify Task.isDone() returns true whether task succeeds or fails and only one callback fires
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskIsDoneTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let successTask: taskpool.Task = new taskpool.Task(simpleFunc)
      let successCalled: boolean = false
      let failCalled: boolean = false
      let cbSucc3: () => void = (): void => {        successCalled = true}
      successTask.onExecutionSucceeded(cbSucc3)
      successTask.onExecutionFailed((e: Error) => {
        failCalled = e instanceof Error
      })
      try {
        await taskpool.execute(successTask);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(successCalled).assertTrue()
      expect(failCalled).assertFalse()
      expect(successTask.isDone()).assertTrue()

      let failTask: taskpool.Task = new taskpool.Task(failedFunc)
      let successCalled2: boolean = false
      let failCalled2: boolean = false
      let cbSucc4: () => void = (): void => {        successCalled2 = true}
      failTask.onExecutionSucceeded(cbSucc4)
      failTask.onExecutionFailed((e: Error) => {
        failCalled2 = e instanceof Error
      })
      let errorThrown2300: boolean = false
      try {
        await taskpool.execute(failTask)
      } catch (e) {
        errorThrown2300 = true
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(errorThrown2300).assertTrue()
      expect(successCalled2).assertFalse()
      expect(failCalled2).assertTrue()
      expect(failTask.isDone()).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest1800
     * @tc.number SUB_TASK_IS_DONE_TEST_1800
     * @tc.desc   Verify Task.isDone() returns true after task is canceled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskIsDoneTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longFunc)
      let executePromise: Promise<Any> = taskpool.execute(task, { timeout: 10000 })
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      let isDoneBeforeCancel: boolean = task.isDone()
      if (!isDoneBeforeCancel) {
        try {
          taskpool.cancel(task)
        } catch (e) {
          // Task may complete before cancel reaches the runtime
        }
      }
      try {
        await executePromise
      } catch (e) {
        // Cancellation can reject a task that has not started yet
      }
      expect(task.isDone()).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest1900
     * @tc.number SUB_TASK_IS_DONE_TEST_1900
     * @tc.desc   Verify Task.isDone() returns independent results for multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsDoneTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(taskFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(taskFunc, 200.0)
      let task3: taskpool.Task = new taskpool.Task(taskFunc, 300.0)
      expect(task1.isDone()).assertFalse()
      expect(task2.isDone()).assertFalse()
      expect(task3.isDone()).assertFalse()
      try {
        await taskpool.execute(task1);
      } catch (error) {
        expect().assertFail();
      }
      expect(task1.isDone()).assertTrue()
      expect(task2.isDone()).assertFalse()
      expect(task3.isDone()).assertFalse()
      try {
        await taskpool.execute(task2);
      } catch (error) {
        expect().assertFail();
      }
      expect(task1.isDone()).assertTrue()
      expect(task2.isDone()).assertTrue()
      expect(task3.isDone()).assertFalse()
      try {
        await taskpool.execute(task3);
      } catch (error) {
        expect().assertFail();
      }
      expect(task1.isDone()).assertTrue()
      expect(task2.isDone()).assertTrue()
      expect(task3.isDone()).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest2000
     * @tc.number SUB_TASK_IS_DONE_TEST_2000
     * @tc.desc   Verify Task.isDone() returns true for all tasks after concurrent execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskIsDoneTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(multiplyFunc, 1.0)
      let task2: taskpool.Task = new taskpool.Task(multiplyFunc, 2.0)
      let task3: taskpool.Task = new taskpool.Task(multiplyFunc, 3.0)
      expect(task1.isDone()).assertFalse()
      expect(task2.isDone()).assertFalse()
      expect(task3.isDone()).assertFalse()
      try {
        await Promise.all([taskpool.execute(task1), taskpool.execute(task2), taskpool.execute(task3)]);
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(task1.isDone()).assertTrue()
      expect(task2.isDone()).assertTrue()
      expect(task3.isDone()).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest2100
     * @tc.number SUB_TASK_IS_DONE_TEST_2100
     * @tc.desc   Verify Task.isDone() returns false for repeated checks during execution and true after completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskIsDoneTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longFunc)
      let executePromise: Promise<Any> = taskpool.execute(task)
      try {
        await Utils.msSleep(50);
      } catch (error) {
        expect().assertFail();
      }
      let results: boolean[] = []
      for (let i = 0; i < 5; i++) {
        results.push(task.isDone())
      }
      try {
        await executePromise;
      } catch (error) {
        expect().assertFail();
      }
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertFalse()
      }
      expect(task.isDone()).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest2200
     * @tc.number SUB_TASK_IS_DONE_TEST_2200
     * @tc.desc   Verify onExecutionSucceeded fires once and isDone is true after execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskIsDoneTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let successCount: AtomicInt = new AtomicInt(0)
      let task: taskpool.Task = new taskpool.Task(simpleFunc)
      let cbSucc5: () => void = (): void => {        successCount.fetchAdd(1)}
      task.onExecutionSucceeded(cbSucc5)
      try {
        await taskpool.execute(task);
      } catch (error) {
        expect().assertFail();
      }
      let begin: number = Date.now()
      while (successCount.load() < 1 && Date.now() - begin < 5000) {
        try {
          await Utils.msSleep(100);
        } catch (error) {
          expect().assertFail();
        }
      }
      expect(successCount.load()).assertEqual(1)
      // state is FINISHED before callback dispatch, so isDone() is true once the callback fired
      expect(task.isDone()).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest2300
     * @tc.number SUB_TASK_IS_DONE_TEST_2300
     * @tc.desc   Verify Task.isDone() returns false for concurrent checks during execution and true after completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskIsDoneTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longFunc)
      let executePromise: Promise<Any> = taskpool.execute(task)
      let results: boolean[] = [];
      try {
        await Utils.msSleep(100);
        for (let i = 0; i < 10; i++) {
          results.push(task.isDone())
        }
      } catch (error) {
        expect().assertFail();
      }
      try {
        await executePromise;
      } catch (error) {
        expect().assertFail();
      }
      expect(results.length).assertEqual(10)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertFalse()
      }
      expect(task.isDone()).assertTrue()
      done();
    })

        /**
     * @tc.name   TaskIsDoneTest2400
     * @tc.number SUB_TASK_IS_DONE_TEST_2400
     * @tc.desc   Verify Task.isDone() returns true for previous task when retrying
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskIsDoneTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let attempts: number = 0
      let lastTaskDone: boolean = false
      let finalResult: number = 0
      let lastTask: taskpool.Task | null = null
      for (let i = 0; i < 3; i++) {
        attempts++
        let task: taskpool.Task = new taskpool.Task(retryableFunc, i < 2)
        lastTask = task
        try {
          let result: Any = await taskpool.execute(task)
          expect(task.isDone()).assertTrue()
          lastTaskDone = task.isDone()
          finalResult = result as number
          break
        } catch (e) {
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect().assertFail();
          }
          expect(task.isDone()).assertTrue()
          lastTaskDone = task.isDone()
        }
      }
      expect(finalResult).assertEqual(100)
      expect(attempts).assertEqual(3)
      expect(lastTaskDone).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskIsDoneTest2500
     * @tc.number SUB_TASK_IS_DONE_TEST_2500
     * @tc.desc   Verify Task.isDone() returns true after task fails with error message assertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskIsDoneTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(failedWithMsgFunc)
      let callbackExecuted: boolean = false
      task.onExecutionFailed((e: Error) => {
        expect(e.message).assertEqual("Task execution failed due to timeout")
        callbackExecuted = true
      })
      let errorThrown4000: boolean = false
      try {
        await taskpool.execute(task)
      } catch (e) {
        errorThrown4000 = true
      }
      try {
        await Utils.msSleep(100);
      } catch (error) {
        expect().assertFail();
      }
      expect(errorThrown4000).assertTrue()
      expect(callbackExecuted).assertTrue()
      expect(task.isDone()).assertTrue()
      done();
    })
  })
}
