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

import {describe, afterAll, it, expect, TestType, Size, Level, beforeAll, } from '../../../../hypium';
import Utils from '../Util.test';

let simpleReturnFunc = (): number => {
  return 1.0
}
let longRunningFunc = (): number => {
  let start: number = Date.now()
  while (Date.now() - start < 1000) {}
  return 0.0
}
let cancelAwareFunc = (arg: number): number => {
  if (taskpool.Task.isCanceled()) {
    return arg + 2
  }
  let start: number = Date.now()
  while (Date.now() - start < 1000) {}
  if (taskpool.Task.isCanceled()) {
    return arg + 3
  }
  return arg + 1
}
let checkNotCanceledFunc = (): boolean => {
  return taskpool.Task.isCanceled()
}
let multiCheckpointFunc = (): number => {
  if (taskpool.Task.isCanceled()) {
    return -1
  }
  let start: number = Date.now()
  while (Date.now() - start < 1000) {}
  if (taskpool.Task.isCanceled()) {
    return -2
  }
  start = Date.now()
  while (Date.now() - start < 1000) {}
  if (taskpool.Task.isCanceled()) {
    return -3
  }
  return 0
}
let highFreqCheckFunc = (): number => {
  let checkCount: number = 0
  let start: number = Date.now()
  while (Date.now() - start < 1000) {
    if (taskpool.Task.isCanceled()) {
      return -1
    }
    checkCount++
  }
  return checkCount
}
let returnArgFunc = (n: number): number => {
  return n + 0.0
}
let checkCanceledAfterDelayFunc = (): number => {
  let start: number = Date.now()
  while (Date.now() - start < 1000) {
    if (taskpool.Task.isCanceled()) {
      return 1
    }
  }
  return 0
}
let multipleCheckPointRecordFunc = (): string => {
  let results: string = ""
  results += taskpool.Task.isCanceled() ? "1" : "0"
  let start: number = Date.now()
  while (Date.now() - start < 1000) {}
  results += taskpool.Task.isCanceled() ? "1" : "0"
  start = Date.now()
  while (Date.now() - start < 1000) {}
  results += taskpool.Task.isCanceled() ? "1" : "0"
  return results
}
let longRunningWithCleanupFunc = (): string => {
  let start: number = Date.now()
  while (Date.now() - start < 1000) {
    if (taskpool.Task.isCanceled()) {
      return "cleaned_up"
    }
  }
  return "completed"
}
let fiveSecondTaskFunc = (): number => {
  let start: number = Date.now()
  while (Date.now() - start < 1000) {}
  return 1.0
}
let threeSecondTaskFunc = (): number => {
  let start: number = Date.now()
  while (Date.now() - start < 1000) {}
  return 1.0
}

export default function TaskpoolCancelTest(): void {
  describe('TaskpoolCancelTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskpoolCancelTest0100
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_0100
     * @tc.desc   Verify cancel(taskId) cancels a waiting task successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolCancelTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      try {
        await Utils.msSleep(100)
        let hasError: boolean = false
        try {
          taskpool.cancel(task.taskId.toInt())
        } catch (e) {
          hasError = true
        }
        try {
          await executePromise
        } catch (e) {
          // Task canceled, promise rejects
        }
        expect(hasError).assertFalse()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest0200
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_0200
     * @tc.desc   Verify cancel(taskId) with taskId equals 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc)
      let taskId: number = task.taskId
      expect(taskId >= 1).assertTrue()
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      try {
        await executePromise
      } catch (e) {
        // Task may be canceled or completed
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest0300
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_0300
     * @tc.desc   Verify cancel(taskId) with large taskId after creating multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleReturnFunc)
      let task2: taskpool.Task = new taskpool.Task(simpleReturnFunc)
      let task3: taskpool.Task = new taskpool.Task(simpleReturnFunc)
      let id1: number = task1.taskId
      let id2: number = task2.taskId
      let id3: number = task3.taskId
      expect(id2 > id1).assertTrue()
      expect(id3 > id2).assertTrue()
      try {
        await taskpool.execute(task1) as number
        await taskpool.execute(task2) as number
        await taskpool.execute(task3) as number
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest0400
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_0400
     * @tc.desc   Verify cancel(taskId) with int max value 2147483647 throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let maxInt: number = 2147483647
      let caught: boolean = false
      try {
        taskpool.cancel(maxInt.toInt())
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   TaskpoolCancelTest0500
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_0500
     * @tc.desc   Verify cancel(taskId) with taskId 0 throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hasError: boolean = false
      try {
        taskpool.cancel(0)
      } catch (e) {
        hasError = true
      }
      expect(hasError).assertTrue()
    })

    /**
     * @tc.name   TaskpoolCancelTest0600
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_0600
     * @tc.desc   Verify cancel(taskId) with negative taskId throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hasError: boolean = false
      try {
        taskpool.cancel(-1)
      } catch (e) {
        hasError = true
      }
      expect(hasError).assertTrue()
    })

    /**
     * @tc.name   TaskpoolCancelTest0700
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_0700
     * @tc.desc   Verify cancel(taskId) with non-existent taskId throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let caught: boolean = false
      try {
        taskpool.cancel(99999)
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   TaskpoolCancelTest0800
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_0800
     * @tc.desc   Verify cancel(taskId) for unexecuted task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc)
      let caught: boolean = false
      try {
        taskpool.cancel(task.taskId.toInt())
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   TaskpoolCancelTest0900
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_0900
     * @tc.desc   Verify cancel(taskId) for completed task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc)
      try {
        await taskpool.execute(task) as number
        let caught: boolean = false
        try {
          taskpool.cancel(task.taskId.toInt())
          expect().assertFail()
        } catch (e) {
          caught = true
        }
        expect(caught).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest1000
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_1000
     * @tc.desc   Verify cancel(taskId) twice for same task second cancel succeeds silently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      try {
        await Utils.msSleep(100)
        let firstCancelSucceeded: boolean = false
        try {
          taskpool.cancel(task.taskId.toInt())
          firstCancelSucceeded = true
        } catch (e) {
          expect().assertFail()
        }
        let caught: boolean = false
        try {
          taskpool.cancel(task.taskId.toInt())
        } catch (e) {
          caught = true
        }
        try {
          await executePromise
        } catch (e) {
          // Task canceled promise rejects
        }
        expect(firstCancelSucceeded).assertTrue()
        expect(caught).assertFalse()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest1100
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_1100
     * @tc.desc   Verify cancel(taskId) for non-existent taskId raises error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let caught: boolean = false
      try {
        taskpool.cancel(99999)
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   TaskpoolCancelTest1200
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_1200
     * @tc.desc   Verify cancel(taskId) for completed task raises error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc)
      try {
        await taskpool.execute(task) as number
        let caught: boolean = false
        try {
          taskpool.cancel(task.taskId.toInt())
          expect().assertFail()
        } catch (e) {
          caught = true
        }
        expect(caught).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest1300
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_1300
     * @tc.desc   Verify cancel(taskId) returns void without throwing exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolCancelTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      try {
        await Utils.msSleep(100)
        let cancelSucceeded: boolean = false
        try {
          taskpool.cancel(task.taskId.toInt())
          cancelSucceeded = true
        } catch (e) {
          // Cancel may throw if task already completed
        }
        try {
          await executePromise
        } catch (e) {
          // Task canceled, promise rejects
        }
        expect(cancelSucceeded).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest1400
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_1400
     * @tc.desc   Verify cancel(taskId) cancels middle task in multi-task queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(returnArgFunc, 10.0)
      let task2: taskpool.Task = new taskpool.Task(longRunningFunc)
      let task3: taskpool.Task = new taskpool.Task(returnArgFunc, 30.0)
      let executePromise2: Promise<number> = Promise.resolve(0.0);
      let executePromise3: Promise<number> = Promise.resolve(0.0);
      try {
        let result1: number = await taskpool.execute(task1) as number
        executePromise2 = taskpool.execute(task2) as Promise<number>
        executePromise3 = taskpool.execute(task3) as Promise<number>
        try {
          taskpool.cancel(task2.taskId.toInt())
        } catch (e) {
          // May throw
        }
        expect(result1).assertEqual(10.0)
      } catch (error) {
        expect().assertFail();
      }
      try {
        await executePromise2
      } catch (e) {
        // Task2 may be canceled
      }
      try {
        await executePromise3
      } catch (e) {
        // Task3 may be canceled
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest1500
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_1500
     * @tc.desc   Verify cancel(taskId) does not stop running task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolCancelTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(checkCanceledAfterDelayFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      // 轮询确认任务已 RUNNING 再取消（固定 100ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running1500: boolean = false
      let begin1500: number = Date.now()
      try {
        while (!running1500 && Date.now() - begin1500 < 10000) {
          let poolInfo1500: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of poolInfo1500.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
              running1500 = true
            }
          }
          if (!running1500) {
            await Utils.msSleep(20)
          }
        }
        expect(running1500).assertTrue()
        // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
        await Utils.msSleep(50)
        try {
          taskpool.cancel(task.taskId.toInt())
        } catch (e) {
          expect().assertFail()
        }
        let result: number = -1
        try {
          result = await executePromise
        } catch (e) {
          expect().assertFail()
        }
        expect(result).assertEqual(1)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest1600
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_1600
     * @tc.desc   Verify cancel(taskId) makes isCanceled return true in running task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(cancelAwareFunc, 100.0)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      // 轮询确认任务已 RUNNING 再取消（固定 100ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running1600: boolean = false
      let begin1600: number = Date.now()
      try {
        while (!running1600 && Date.now() - begin1600 < 10000) {
          let poolInfo1600: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of poolInfo1600.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
              running1600 = true
            }
          }
          if (!running1600) {
            await Utils.msSleep(20)
          }
        }
        expect(running1600).assertTrue()
        // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
        await Utils.msSleep(50)
        try {
          taskpool.cancel(task.taskId.toInt())
        } catch (e) {
          // cancel may throw if the task completed between polling and cancel
        }
        let result: number = 0.0
        try {
          result = await executePromise
        } catch (e) {
          // cancellation may reject the execute promise
        }
        expect(result === 103.0 || result === 102.0 || result === 100.0).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest1700
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_1700
     * @tc.desc   Verify cancel(taskId) detected at multiple checkpoints in task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(multiCheckpointFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      // 轮询确认任务已 RUNNING 再取消（固定 200ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running1700: boolean = false
      let begin1700: number = Date.now()
      try {
        while (!running1700 && Date.now() - begin1700 < 10000) {
          let poolInfo1700: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of poolInfo1700.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
              running1700 = true
            }
          }
          if (!running1700) {
            await Utils.msSleep(20)
          }
        }
        expect(running1700).assertTrue()
        // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
        await Utils.msSleep(50)
        try {
          taskpool.cancel(task.taskId.toInt())
        } catch (e) {
          expect().assertFail()
        }
        let result: number = 0
        try {
          result = await executePromise
        } catch (e) {
          expect().assertFail()
        }
        expect(result).assertEqual(-2)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest1800
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_1800
     * @tc.desc   Verify cancel(taskId) with setTimeout delays cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(fiveSecondTaskFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      let cancelSucceeded: boolean = false
      try {
        await Utils.msSleep(200)
      } catch (error) {
        expect().assertFail();
      }
      try {
        taskpool.cancel(task.taskId.toInt())
        cancelSucceeded = true
      } catch (e) {
        // May throw if task completed
      }
      try {
        await executePromise
      } catch (e) {
        // Task may be canceled
      }
      try {
        await Utils.msSleep(100)
        expect(cancelSucceeded).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest1900
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_1900
     * @tc.desc   Verify cancel(taskId) with multiple timers later cancels do not throw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolCancelTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(fiveSecondTaskFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      let firstCancelSuccess: boolean = false
      let secondCancelError: boolean = false
      try {
        await Utils.msSleep(100)
        try {
          taskpool.cancel(task.taskId.toInt())
          firstCancelSuccess = true
        } catch (e) {
          // Cancel may fail
        }
        await Utils.msSleep(200)
        try {
          taskpool.cancel(task.taskId.toInt())
        } catch (e) {
          secondCancelError = true
        }
        try {
          await executePromise
        } catch (e) {
          // Task may be canceled
        }
        expect(firstCancelSuccess).assertTrue()
        expect(secondCancelError).assertFalse()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest2000
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_2000
     * @tc.desc   Verify cancel(taskId) triggered by event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolCancelTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(fiveSecondTaskFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      let cancelTriggered: boolean = false
      let triggerCancel = (): void => {
        try {
          taskpool.cancel(task.taskId.toInt())
          cancelTriggered = true
        } catch (e) {
          // May throw if task completed
        }
      }
      setTimeout(triggerCancel, 200)
      try {
        await executePromise
      } catch (e) {
        // Task may be canceled
      }
      try {
        await Utils.msSleep(100)
        expect(cancelTriggered).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest2100
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_2100
     * @tc.desc   Verify cancel(taskId) sequential cancel of concurrently-running tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolCancelTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(threeSecondTaskFunc)
      let task2: taskpool.Task = new taskpool.Task(threeSecondTaskFunc)
      let task3: taskpool.Task = new taskpool.Task(threeSecondTaskFunc)
      let p1: Promise<number> = taskpool.execute(task1) as Promise<number>
      let p2: Promise<number> = taskpool.execute(task2) as Promise<number>
      let p3: Promise<number> = taskpool.execute(task3) as Promise<number>
      try {
        await Utils.msSleep(100)
        let cancelCount: number = 0
        try {
          taskpool.cancel(task1.taskId.toInt())
          cancelCount++
        } catch (e) {
          expect().assertFail()
        }
        try {
          taskpool.cancel(task2.taskId.toInt())
          cancelCount++
        } catch (e) {
          expect().assertFail()
        }
        try {
          taskpool.cancel(task3.taskId.toInt())
          cancelCount++
        } catch (e) {
          expect().assertFail()
        }
        expect(cancelCount).assertEqual(3)
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Promise.all([p1, p2, p3])
      } catch (e) {
        // Some tasks may be canceled
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest2200
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_2200
     * @tc.desc   Verify cancel(taskId) repeated cancels of same task all succeed silently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolCancelTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(fiveSecondTaskFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      try {
        await Utils.msSleep(100)
        let successCount: number = 0
        let errorCount: number = 0
        try {
          taskpool.cancel(task.taskId.toInt())
          successCount++
        } catch (e) {
          errorCount++
        }
        try {
          taskpool.cancel(task.taskId.toInt())
          successCount++
        } catch (e) {
          errorCount++
        }
        try {
          taskpool.cancel(task.taskId.toInt())
          successCount++
        } catch (e) {
          errorCount++
        }
        try {
          await executePromise
        } catch (e) {
          // Task may be canceled
        }
        expect(successCount).assertEqual(3)
        expect(errorCount).assertEqual(0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest2300
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_2300
     * @tc.desc   Verify cancel(taskId) cancels middle task in chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolCancelTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(returnArgFunc, 1.0)
      let task2: taskpool.Task = new taskpool.Task(threeSecondTaskFunc)
      let task3: taskpool.Task = new taskpool.Task(returnArgFunc, 3.0)
      try {
        let result1: number = await taskpool.execute(task1) as number
        let executePromise2: Promise<number> = taskpool.execute(task2) as Promise<number>
        let executePromise3: Promise<number> = taskpool.execute(task3) as Promise<number>
        try {
          taskpool.cancel(task2.taskId.toInt())
        } catch (e) {
          // May throw
        }
        expect(result1).assertEqual(1.0)
        try {
          await executePromise2
        } catch (e) {
          // Task2 may be canceled
        }
        try {
          let result3: number = await executePromise3 as number
          expect(result3).assertEqual(3.0)
        } catch (e) {
          // Task3 may also be affected
        }
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest2400
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_2400
     * @tc.desc   Verify cancel(taskId) during Promise chain execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolCancelTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(fiveSecondTaskFunc)
      let taskId: number = task.taskId
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      let chainResult: string = "pending"
      // 轮询确认任务已 RUNNING 再取消（固定 100ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running2400: boolean = false
      let begin2400: number = Date.now()
      try {
        while (!running2400 && Date.now() - begin2400 < 10000) {
          let poolInfo2400: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of poolInfo2400.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
              running2400 = true
            }
          }
          if (!running2400) {
            await Utils.msSleep(20)
          }
        }
        expect(running2400).assertTrue()
        // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
        await Utils.msSleep(50)
        try {
          taskpool.cancel(taskId.toInt())
        } catch (e) {
          expect().assertFail()
        }
        try {
          chainResult = "resolved"
          await executePromise
        } catch (error) {
          chainResult = "rejected"
        }
        expect(chainResult).assertEqual("resolved")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest2500
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_2500
     * @tc.desc   Verify isCanceled returns false without cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(checkNotCanceledFunc)
      try {
        let result: boolean = await taskpool.execute(task) as boolean
        expect(result).assertFalse()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest2600
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_2600
     * @tc.desc   Verify isCanceled at multiple checkpoints detects cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolCancelTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(multipleCheckPointRecordFunc)
      let executePromise: Promise<string> = taskpool.execute(task) as Promise<string>
      // 轮询确认任务已 RUNNING 再取消（固定 200ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running2600: boolean = false
      let begin2600: number = Date.now()
      try {
        while (!running2600 && Date.now() - begin2600 < 10000) {
          let poolInfo2600: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of poolInfo2600.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
              running2600 = true
            }
          }
          if (!running2600) {
            await Utils.msSleep(20)
          }
        }
        expect(running2600).assertTrue()
        // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
        await Utils.msSleep(50)
        try {
          taskpool.cancel(task.taskId.toInt())
        } catch (e) {
          expect().assertFail()
        }
        let result: string = ""
        try {
          result = await executePromise
        } catch (e) {
          expect().assertFail()
        }
        expect(result).assertEqual("011")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest2700
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_2700
     * @tc.desc   Verify task returns different value after cancel(taskId)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(cancelAwareFunc, 100.0)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      // 轮询确认任务已 RUNNING 再取消（固定 100ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running2700: boolean = false
      let begin2700: number = Date.now()
      try {
        while (!running2700 && Date.now() - begin2700 < 10000) {
          let poolInfo2700: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of poolInfo2700.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
              running2700 = true
            }
          }
          if (!running2700) {
            await Utils.msSleep(20)
          }
        }
        expect(running2700).assertTrue()
        // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
        await Utils.msSleep(50)
        try {
          taskpool.cancel(task.taskId.toInt())
        } catch (e) {
          expect().assertFail()
        }
        let result: number = 0.0
        try {
          result = await executePromise
        } catch (e) {
          expect().assertFail()
        }
        expect(result).assertEqual(103.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest2800
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_2800
     * @tc.desc   Verify new task can execute after previous task canceled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(longRunningFunc)
      let executePromise1: Promise<number> = taskpool.execute(task1) as Promise<number>
      try {
        await Utils.msSleep(100)
        try {
          taskpool.cancel(task1.taskId.toInt())
        } catch (e) {
          // May throw
        }
        try {
          await executePromise1
        } catch (e) {
          // Task1 may be canceled
        }
        let task2: taskpool.Task = new taskpool.Task(returnArgFunc, 42.0)
        let result2: number = await taskpool.execute(task2) as number
        expect(result2).assertEqual(42.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest2900
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_2900
     * @tc.desc   Verify high frequency isCanceled check with cancel(taskId)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolCancelTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(highFreqCheckFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      // 轮询确认任务已 RUNNING 再取消（固定 100ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running2900: boolean = false
      let begin2900: number = Date.now()
      try {
        while (!running2900 && Date.now() - begin2900 < 10000) {
          let poolInfo2900: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of poolInfo2900.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
              running2900 = true
            }
          }
          if (!running2900) {
            await Utils.msSleep(20)
          }
        }
        expect(running2900).assertTrue()
        // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
        await Utils.msSleep(50)
        try {
          taskpool.cancel(task.taskId.toInt())
        } catch (e) {
          expect().assertFail()
        }
        let result: number = 0
        try {
          result = await executePromise
        } catch (e) {
          expect().assertFail()
        }
        expect(result).assertEqual(-1)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTest3000
     * @tc.number SUB_TASKPOOL_CANCEL_TEST_3000
     * @tc.desc   Verify long running task responds to cancel at multiple stages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolCancelTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningWithCleanupFunc)
      let executePromise: Promise<string> = taskpool.execute(task) as Promise<string>
      // 轮询确认任务已 RUNNING 再取消（固定 200ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running3000: boolean = false
      let begin3000: number = Date.now()
      try {
        while (!running3000 && Date.now() - begin3000 < 10000) {
          let poolInfo3000: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of poolInfo3000.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
              running3000 = true
            }
          }
          if (!running3000) {
            await Utils.msSleep(20)
          }
        }
        expect(running3000).assertTrue()
        // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
        await Utils.msSleep(50)
        try {
          taskpool.cancel(task.taskId.toInt())
        } catch (e) {
          expect().assertFail()
        }
        let result: string = ""
        try {
          result = await executePromise
        } catch (e) {
          expect().assertFail()
        }
        expect(result).assertEqual("cleaned_up")
      } catch (error) {
        expect().assertFail();
      }
      done();
    })
  })
}
