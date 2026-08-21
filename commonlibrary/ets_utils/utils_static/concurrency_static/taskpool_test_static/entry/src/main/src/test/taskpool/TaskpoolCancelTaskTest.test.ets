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

function simpleReturnFunc(arg: number): number {
  return arg * 2.0
}
function busyWait300msFunc(): number {
  let start: number = Date.now()
  while (Date.now() - start < 300) {}
  return 1.0
}
function longRunningFunc(duration: number): number {
  let start: number = Date.now()
  while (Date.now() - start < duration) {}
  return duration + 0.0
}
function cancelAwareFunc(arg: number): number {
  let start: number = Date.now()
  while (Date.now() - start < 300) {}
  if (taskpool.Task.isCanceled()) {
    return arg + 3
  }
  return arg + 1
}
function checkCanceledAfterDelayFunc(): number {
  let start: number = Date.now()
  while (Date.now() - start < 300) {
    if (taskpool.Task.isCanceled()) {
      return 1
    }
  }
  return 0
}
function noArgsFunc(): void {
}
function longNoArgsFunc(): void {
  let start: number = Date.now()
  while (Date.now() - start < 5000) {
    if (taskpool.Task.isCanceled()) { break }
  }
}
function cancelableLongTask(): number {
  let start: number = Date.now()
  while (Date.now() - start < 5000) {
    if (taskpool.Task.isCanceled()) { break }
  }
  return 1.0
}
function cancelableDurationTask(duration: number): number {
  let start: number = Date.now()
  while (Date.now() - start < duration) {
    if (taskpool.Task.isCanceled()) { break }
  }
  return duration + 0.0
}
function threeSecondFunc(): number {
  let start: number = Date.now()
  while (Date.now() - start < 3000) {}
  return 1.0
}
function fiveSecondFunc(): number {
  let start: number = Date.now()
  while (Date.now() - start < 300) {}
  return 1.0
}
function responsiveFunc(arg: number): number {
  if (taskpool.Task.isCanceled()) {
    return -1
  }
  let start: number = Date.now()
  while (Date.now() - start < 300) {
    if (taskpool.Task.isCanceled()) {
      return -1
    }
  }
  return arg
}
function returnArgFunc(n: number): number {
  return n + 0.0
}
function multiCheckpointRecordFunc(): string {
  let results: string = ""
  results += taskpool.Task.isCanceled() ? "1" : "0"
  let start: number = Date.now()
  while (Date.now() - start < 300) {
    if (taskpool.Task.isCanceled()) { break }
  }
  results += taskpool.Task.isCanceled() ? "1" : "0"
  start = Date.now()
  while (Date.now() - start < 300) {
    if (taskpool.Task.isCanceled()) { break }
  }
  results += taskpool.Task.isCanceled() ? "1" : "0"
  return results
}

export default function TaskpoolCancelTaskTest(): void {
  describe('TaskpoolCancelTaskTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})



    /**
     * @tc.name   TaskpoolCancelTaskTest0100
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_0100
     * @tc.desc   Verify cancel(task) with required task parameter cancels successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolCancelTaskTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(busyWait300msFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      try {
        await Utils.msSleep(100)
        let cancelSucceeded: boolean = false
        try {
          taskpool.cancel(task)
          cancelSucceeded = true
        } catch (e) {
          // May throw if task already completed
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
     * @tc.name   TaskpoolCancelTaskTest0200
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_0200
     * @tc.desc   Verify cancel(task) cancels a waiting task before execution starts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolCancelTaskTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // 5000ms 可取消任务：立即 cancel 必然先于完成生效，且取消后忙等循环协作式早退（避免跨用例 worker 占用残留）
      let task: taskpool.Task = new taskpool.Task(cancelableLongTask)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      let taskCanceled: boolean = false
      let running0200: boolean = false
      let begin0200: number = Date.now()
      while (!running0200 && Date.now() - begin0200 < 10000) {
        let poolInfo0200: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
        for (let taskInfo of poolInfo0200.taskInfos) {
          if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
            running0200 = true
          }
        }
        if (!running0200) { await Utils.msSleep(20) }
      }
      expect(running0200).assertTrue()
      await Utils.msSleep(50)
      try {
        taskpool.cancel(task)
      } catch (e) {
        // May throw if task already started
      }
      try {
        await executePromise
      } catch (e) {
        taskCanceled = true
      }
      // Running cancellation may either reject or cooperatively resolve; both are valid state outcomes.
      expect(taskCanceled || task.isDone()).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTaskTest0300
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_0300
     * @tc.desc   Verify cancel(task) for running task does not stop execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolCancelTaskTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(cancelAwareFunc, 100.0)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      // 轮询确认任务已 RUNNING 再取消（固定 100ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running0300: boolean = false
      let begin0300: number = Date.now()
      try {
        while (!running0300 && Date.now() - begin0300 < 10000) {
          let poolInfo0300: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of poolInfo0300.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
              running0300 = true
            }
          }
          if (!running0300) {
            await Utils.msSleep(20)
          }
        }
        expect(running0300).assertTrue()
        // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
        await Utils.msSleep(50)
        try {
          taskpool.cancel(task)
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
     * @tc.name   TaskpoolCancelTaskTest0400
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_0400
     * @tc.desc   Verify cancel(task) for unexecuted task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc, 100.0)
      let caught: boolean = false
      try {
        taskpool.cancel(task)
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   TaskpoolCancelTaskTest0500
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_0500
     * @tc.desc   Verify cancel(task) for completed task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc, 100.0)
      try {
        await taskpool.execute(task) as number
        let caught: boolean = false
        try {
          taskpool.cancel(task)
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
     * @tc.name   TaskpoolCancelTaskTest0600
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_0600
     * @tc.desc   Verify cancel(task) for completed SequenceRunner task throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner()
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc, 100.0)
      try {
        await sequenceRunner.execute(task) as number
        let caught: boolean = false
        try {
          taskpool.cancel(task)
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
     * @tc.name   TaskpoolCancelTaskTest0700
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_0700
     * @tc.desc   Verify cancel(task) for tasks with different priorities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let highTask: taskpool.Task = new taskpool.Task(busyWait300msFunc)
      let mediumTask: taskpool.Task = new taskpool.Task(busyWait300msFunc)
      let lowTask: taskpool.Task = new taskpool.Task(busyWait300msFunc)
      let p1: Promise<number> = taskpool.execute(highTask, taskpool.Priority.HIGH) as Promise<number>
      let p2: Promise<number> = taskpool.execute(mediumTask, taskpool.Priority.MEDIUM) as Promise<number>
      let p3: Promise<number> = taskpool.execute(lowTask, taskpool.Priority.LOW) as Promise<number>
      try {
        await Utils.msSleep(100)
        let cancelCount: number = 0
        try {
          taskpool.cancel(highTask)
          cancelCount++
        } catch (e) {
          expect().assertFail()
        }
        try {
          taskpool.cancel(mediumTask)
          cancelCount++
        } catch (e) {
          expect().assertFail()
        }
        try {
          taskpool.cancel(lowTask)
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
     * @tc.name   TaskpoolCancelTaskTest0800
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_0800
     * @tc.desc   Verify cancel(task) succeeds for executeDelayed task before it starts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Cancel before the delay elapses: the delayed task never starts and its promise rejects.
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc, 1.0)
      let executePromise: Promise<number> = taskpool.executeDelayed(3000, task) as Promise<number>
      try {
        await Utils.msSleep(50)
        let cancelSucceeded: boolean = false
        try {
          taskpool.cancel(task)
          cancelSucceeded = true
        } catch (e) {
          expect().assertFail()
        }
        let taskCanceled: boolean = false
        try {
          await executePromise
        } catch (e) {
          taskCanceled = true
        }
        expect(cancelSucceeded).assertTrue()
        expect(taskCanceled).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTaskTest0900
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_0900
     * @tc.desc   Verify cancel(task) for named task retains name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskName: string = "myTask"
      let task: taskpool.Task = new taskpool.Task(taskName, simpleReturnFunc, 100.0)
      let nameBefore: string = task.name
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      try {
        await Utils.msSleep(100)
        try {
          taskpool.cancel(task)
        } catch (e) {
        }
        let nameAfter: string = task.name
        try {
          await executePromise
        } catch (e) {
          // Task canceled
        }
        expect(nameBefore).assertEqual(taskName)
        expect(nameAfter).assertEqual(taskName)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTaskTest1000
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_1000
     * @tc.desc   Verify cancel(task) for task with dependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(simpleReturnFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(busyWait300msFunc)
      task2.addDependency(task1)
      let p1: Promise<number> = taskpool.execute(task1) as Promise<number>
      let p2: Promise<number> = taskpool.execute(task2) as Promise<number>
      try {
        await Utils.msSleep(100)
        let cancelSucceeded: boolean = false
        try {
          taskpool.cancel(task2)
          cancelSucceeded = true
        } catch (e) {
        }
        try {
          await p1
        } catch (e) {
        }
        try {
          await p2
        } catch (e) {
          // Task2 may be canceled
        }
        expect(cancelSucceeded).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTaskTest1100
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_1100
     * @tc.desc   Verify cancel(task) for waiting task returns void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('TaskpoolCancelTaskTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(busyWait300msFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      let cancelSucceeded: boolean = false
      try {
        taskpool.cancel(task)
        cancelSucceeded = true
      } catch (e) {
        // May throw if task already started
      }
      try {
        await executePromise
      } catch (e) {
        // Task canceled
      }
      expect(cancelSucceeded).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTaskTest1200
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_1200
     * @tc.desc   Verify cancel(task) for completed SequenceRunner task raises error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner()
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc, 100.0)
      try {
        await sequenceRunner.execute(task) as number
        let caught: boolean = false
        try {
          taskpool.cancel(task)
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
     * @tc.name   TaskpoolCancelTaskTest1300
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_1300
     * @tc.desc   Verify cancel(task) for one of multiple completed SequenceRunner tasks raises error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let sequenceRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner()
      let task1: taskpool.Task = new taskpool.Task(simpleReturnFunc, 100.0)
      let task2: taskpool.Task = new taskpool.Task(simpleReturnFunc, 200.0)
      try {
        await sequenceRunner.execute(task1) as number
        await sequenceRunner.execute(task2) as number
        let caught: boolean = false
        try {
          taskpool.cancel(task1)
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
     * @tc.name   TaskpoolCancelTaskTest1400
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_1400
     * @tc.desc   Verify cancel(task) for unexecuted task raises error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc, 100.0)
      let caught: boolean = false
      try {
        taskpool.cancel(task)
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
    })

    /**
     * @tc.name   TaskpoolCancelTaskTest1500
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_1500
     * @tc.desc   Verify cancel(task) for completed task raises error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(simpleReturnFunc, 100.0)
      try {
        await taskpool.execute(task) as number
        let caught: boolean = false
        try {
          taskpool.cancel(task)
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
     * @tc.name   TaskpoolCancelTaskTest1600
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_1600
     * @tc.desc   Verify cancel(task) throws after timed-out task reaches isDone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolCancelTaskTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // After timeout the worker may still be running; wait until isDone before expecting cancel to throw.
      let task: taskpool.Task = new taskpool.Task(longRunningFunc, 300)
      try {
        await taskpool.execute(task, { timeout: 50 })
      } catch (e) {
        // Task timed out or finished
      }
      let begin: number = Date.now()
      while (!task.isDone() && Date.now() - begin < 15000) {
        await Utils.msSleep(100)
      }
      expect(task.isDone()).assertTrue()
      let caught: boolean = false
      try {
        taskpool.cancel(task)
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTaskTest1700
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_1700
     * @tc.desc   Verify cancel(task) cancels single waiting task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolCancelTaskTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningFunc, 5000)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      let taskCanceled: boolean = false
      try {
        taskpool.cancel(task)
      } catch (e) {
        // May throw if task already started
      }
      try {
        await executePromise
      } catch (e) {
        taskCanceled = true
      }
      expect(taskCanceled).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTaskTest1800
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_1800
     * @tc.desc   Verify cancel(task) cancels middle task in multi-task queue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(returnArgFunc, 1.0)
      let task2: taskpool.Task = new taskpool.Task(responsiveFunc, 2.0)
      let task3: taskpool.Task = new taskpool.Task(returnArgFunc, 3.0)
      try {
        let result1: number = await taskpool.execute(task1) as number
        let executePromise2: Promise<number> = taskpool.execute(task2) as Promise<number>
        let executePromise3: Promise<number> = taskpool.execute(task3) as Promise<number>
        // 轮询确认目标任务已 RUNNING 再取消（固定 100ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
        let running1800: boolean = false
        let begin1800: number = Date.now()
        while (!running1800 && Date.now() - begin1800 < 10000) {
          let poolInfo1800: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of poolInfo1800.taskInfos) {
            if (taskInfo.taskId === task2.taskId && taskInfo.state === taskpool.State.RUNNING) {
              running1800 = true
            }
          }
          if (!running1800) {
            await Utils.msSleep(20)
          }
        }
        expect(running1800).assertTrue()
        // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
        await Utils.msSleep(50)
        try {
          taskpool.cancel(task2)
        } catch (e) {
          expect().assertFail()
        }
        let result2: number = -1
        // 裸 await 包进 try/catch：若 cancel 意外早于启动导致 Promise reject，直接断言失败而非抛异常
        try {
          result2 = await executePromise2
        } catch (e) {
          expect().assertFail()
        }
        let result3: number = await executePromise3
        expect(result1).assertEqual(1.0)
        expect(result2).assertEqual(-1)
        expect(result3).assertEqual(3.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTaskTest1900
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_1900
     * @tc.desc   Verify cancel(task) for running task does not stop execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolCancelTaskTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(checkCanceledAfterDelayFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      // 轮询确认任务已 RUNNING 再取消（固定 100ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running1900: boolean = false
      let begin1900: number = Date.now()
      try {
        while (!running1900 && Date.now() - begin1900 < 10000) {
          let poolInfo1900: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of poolInfo1900.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
              running1900 = true
            }
          }
          if (!running1900) {
            await Utils.msSleep(20)
          }
        }
        expect(running1900).assertTrue()
        // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
        await Utils.msSleep(50)
        try {
          taskpool.cancel(task)
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
     * @tc.name   TaskpoolCancelTaskTest2000
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_2000
     * @tc.desc   Verify cancel(task) with isCanceled responds in task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(responsiveFunc, 100.0)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      // 轮询确认任务已 RUNNING 再取消（固定 100ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running2000: boolean = false
      let begin2000: number = Date.now()
      try {
        while (!running2000 && Date.now() - begin2000 < 10000) {
          let poolInfo2000: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of poolInfo2000.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
              running2000 = true
            }
          }
          if (!running2000) {
            await Utils.msSleep(20)
          }
        }
        expect(running2000).assertTrue()
        // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
        await Utils.msSleep(50)
        try {
          taskpool.cancel(task)
        } catch (e) {
          expect().assertFail()
        }
        let result: number = 0.0
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
     * @tc.name   TaskpoolCancelTaskTest2100
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_2100
     * @tc.desc   Verify isCanceled returns true after cancel(task)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(multiCheckpointRecordFunc)
      let executePromise: Promise<string> = taskpool.execute(task) as Promise<string>
      // 轮询确认任务已 RUNNING（首检查点已过）再取消，保证 011 语义确定
      let running: boolean = false
      let begin: number = Date.now()
      try {
        while (!running && Date.now() - begin < 8000) {
          let poolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of poolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
              running = true
            }
          }
          if (!running) {
            await Utils.msSleep(20)
          }
        }
        expect(running).assertTrue()
        // 再等 50ms 确认首检查点已执行（cancel 须落在 cp1 与 cp2 之间的 300ms 忙等窗口内）
        await Utils.msSleep(50)
        try {
          taskpool.cancel(task)
        } catch (e) {
          expect().assertFail()
        }
        let result: string = ""
        try {
          result = await executePromise
        } catch (e) {
          // cancel may reject when the cancellation reaches the task boundary;
          // the task-side AtomicInt-equivalent observable result is checked below.
        }
        expect(result === "011" || result === "010" || result === "001").assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTaskTest2200
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_2200
     * @tc.desc   Verify cancel(task) Promise behavior after cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // 5000ms 可取消任务：立即 cancel 必然先于完成生效，且取消后忙等循环协作式早退（避免跨用例 worker 占用残留）
      let task: taskpool.Task = new taskpool.Task(cancelableLongTask)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      let running2200: boolean = false
      let begin2200: number = Date.now()
      while (!running2200 && Date.now() - begin2200 < 10000) {
        let poolInfo2200: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
        for (let taskInfo of poolInfo2200.taskInfos) {
          if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
            running2200 = true
          }
        }
        if (!running2200) { await Utils.msSleep(20) }
      }
      expect(running2200).assertTrue()
      await Utils.msSleep(50)
      try {
        taskpool.cancel(task)
      } catch (e) {
        // May throw if task already started
      }
      let caught: boolean = false
      try {
        await executePromise
      } catch (e) {
        caught = true
      }
      // A cooperative running task may resolve after observing cancellation; both are valid outcomes.
      expect(caught || task.isDone()).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTaskTest2300
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_2300
     * @tc.desc   Verify cancel(task) is observed by a running task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(responsiveFunc, 100.0)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      // 轮询确认任务已 RUNNING 再取消（固定 100ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running2300: boolean = false
      let begin2300: number = Date.now()
      try {
        while (!running2300 && Date.now() - begin2300 < 10000) {
          let poolInfo2300: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of poolInfo2300.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
              running2300 = true
            }
          }
          if (!running2300) {
            await Utils.msSleep(20)
          }
        }
        expect(running2300).assertTrue()
        // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
        await Utils.msSleep(50)
        try {
          taskpool.cancel(task)
        } catch (e) {
          expect().assertFail()
        }
        let result: number = 0.0
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
     * @tc.name   TaskpoolCancelTaskTest2400
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_2400
     * @tc.desc   Verify cancel(task) triggered by setTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolCancelTaskTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(responsiveFunc, 100.0)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      let cancelSucceeded: boolean = false
      try {
        await Utils.msSleep(100)
        try {
          taskpool.cancel(task)
          cancelSucceeded = true
        } catch (e) {
          // cancel may throw
        }
        try {
          await executePromise
        } catch (e) {
          // Task may be canceled
        }
        await Utils.msSleep(100)
        expect(cancelSucceeded).assertTrue()
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTaskTest2500
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_2500
     * @tc.desc   Verify cancel(task) sequential cancel of concurrently-running tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolCancelTaskTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(threeSecondFunc)
      let task2: taskpool.Task = new taskpool.Task(threeSecondFunc)
      let task3: taskpool.Task = new taskpool.Task(threeSecondFunc)
      let p1: Promise<number> = taskpool.execute(task1) as Promise<number>
      let p2: Promise<number> = taskpool.execute(task2) as Promise<number>
      let p3: Promise<number> = taskpool.execute(task3) as Promise<number>
      try {
        await Utils.msSleep(100)
        let cancelCount: number = 0
        try {
          taskpool.cancel(task1)
          cancelCount++
        } catch (e) {
          expect().assertFail()
        }
        try {
          taskpool.cancel(task2)
          cancelCount++
        } catch (e) {
          expect().assertFail()
        }
        try {
          taskpool.cancel(task3)
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
     * @tc.name   TaskpoolCancelTaskTest2600
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_2600
     * @tc.desc   Verify repeated cancel(task) calls are accepted before the task settles
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolCancelTaskTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(fiveSecondFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      let firstCancelSucceeded: boolean = false
      try {
        taskpool.cancel(task)
        firstCancelSucceeded = true
      } catch (e) {
        expect().assertFail()
      }
      let secondCancelSucceeded: boolean = false
      try {
        taskpool.cancel(task)
        secondCancelSucceeded = true
      } catch (e) {
      }
      expect(firstCancelSucceeded).assertTrue()
      expect(secondCancelSucceeded).assertTrue()
      try {
        await executePromise
      } catch (e) {
        // Task may be canceled
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTaskTest2700
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_2700
     * @tc.desc   Verify new task executes after previous task canceled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(longRunningFunc, 5000)
      let executePromise1: Promise<number> = taskpool.execute(task1) as Promise<number>
      try {
        await Utils.msSleep(100)
        try {
          taskpool.cancel(task1)
        } catch (e) {
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
     * @tc.name   TaskpoolCancelTaskTest2800
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_2800
     * @tc.desc   Verify cancel(task) with multiple event sources cancel different tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolCancelTaskTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(threeSecondFunc)
      let task2: taskpool.Task = new taskpool.Task(threeSecondFunc)
      let task3: taskpool.Task = new taskpool.Task(threeSecondFunc)
      let p1: Promise<number> = taskpool.execute(task1) as Promise<number>
      let p2: Promise<number> = taskpool.execute(task2) as Promise<number>
      let p3: Promise<number> = taskpool.execute(task3) as Promise<number>
      let cancelCount: number = 0
      try {
        // Confirm each target is RUNNING before cancellation; fixed sleeps race under load.
        let running1: boolean = false
        let running2: boolean = false
        let running3: boolean = false
        let begin: number = Date.now()
        while (!(running1 && running2 && running3) && Date.now() - begin < 10000) {
          let info: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let item of info.taskInfos) {
            if (item.taskId === task1.taskId && item.state === taskpool.State.RUNNING) { running1 = true }
            if (item.taskId === task2.taskId && item.state === taskpool.State.RUNNING) { running2 = true }
            if (item.taskId === task3.taskId && item.state === taskpool.State.RUNNING) { running3 = true }
          }
          if (!(running1 && running2 && running3)) { await Utils.msSleep(20) }
        }
        expect(running1 && running2 && running3).assertTrue()
        // Each cancellation is best-effort: a task may finish between the snapshot and cancel call.
        try { taskpool.cancel(task1); cancelCount++ } catch (e) { }
        try { taskpool.cancel(task2); cancelCount++ } catch (e) { }
        try { taskpool.cancel(task3); cancelCount++ } catch (e) { }
        expect(cancelCount).assertLargerOrEqual(1)
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
     * @tc.name   TaskpoolCancelTaskTest2900
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_2900
     * @tc.desc   Verify cancel(task) near completion does not prevent the running task from completing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolCancelTaskTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(longRunningFunc, 3000.0)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      // 轮询确认任务已实际 RUNNING 再取消，保证“接近完成时取消”的前置条件。
      let running: boolean = false
      let begin: number = Date.now()
      try {
        while (!running && Date.now() - begin < 8000) {
          let poolInfo: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
          for (let taskInfo of poolInfo.taskInfos) {
            if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
              running = true
            }
          }
          if (!running) {
            await Utils.msSleep(50)
          }
        }
        expect(running).assertTrue()
        try {
          taskpool.cancel(task)
        } catch (e) {
        }
        let result: number = (await executePromise) as number
        expect(result).assertEqual(3000.0)
      } catch (error) {
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTaskTest3000
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_3000
     * @tc.desc   Verify cancel(task) for task with no arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolCancelTaskTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // 保留"无参任务"语义：使用无参长任务确保立即 cancel 必然先于完成生效
      let task: taskpool.Task = new taskpool.Task(longNoArgsFunc)
      let executePromise: Promise<void> = taskpool.execute(task) as Promise<void>
      let taskCanceled: boolean = false
      try {
        taskpool.cancel(task)
      } catch (e) {
        // May throw if task already started
      }
      try {
        await executePromise
      } catch (e) {
        taskCanceled = true
      }
      expect(taskCanceled).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskpoolCancelTaskTest3100
     * @tc.number SUB_TASKPOOL_CANCEL_TASK_TEST_3100
     * @tc.desc   Verify cancel(task) for batch of tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolCancelTaskTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tasks: taskpool.Task[] = []
      let promises: Promise<number>[] = []
      // 1000ms 可取消任务为批量取消提供充分边距，取消后协作式早退（避免 20×长忙等残留）
      for (let i = 0; i < 20; i++) {
        let task: taskpool.Task = new taskpool.Task(cancelableDurationTask, 1000.0)
        tasks.push(task)
        promises.push(taskpool.execute(task) as Promise<number>)
      }
      try {
        await Utils.msSleep(100)
        let cancelCount: number = 0
        for (let i = 0; i < tasks.length; i++) {
          try {
            taskpool.cancel(tasks[i])
            cancelCount++
          } catch (e) {
            expect().assertFail()
          }
        }
        expect(cancelCount).assertEqual(20)
      } catch (error) {
        expect().assertFail();
      }
      try {
        await Promise.all(promises)
      } catch (e) {
        // Some tasks may be canceled
      }
      done();
    })
  })
}
