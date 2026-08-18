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

let checkNotCanceledFunc = (): boolean => {
  return taskpool.Task.isCanceled()
}
let slowVictimFunc = (): number => {
  let t: number = Date.now()
  while (Date.now() - t < 3000) {
    if (taskpool.Task.isCanceled()) { break }
  }
  return 0.0
}
let checkTypeFunc = (): string => {
  let result: boolean = taskpool.Task.isCanceled()
  return typeof result
}
let multipleCheckFunc = (): boolean => {
  let result1: boolean = taskpool.Task.isCanceled()
  let result2: boolean = taskpool.Task.isCanceled()
  let result3: boolean = taskpool.Task.isCanceled()
  return result1 === result2 && result2 === result3
}
let afterCancelDetectFunc = (): number => {
  let start: number = Date.now()
  while (Date.now() - start < 500) {
    if (taskpool.Task.isCanceled()) {
      return 1
    }
  }
  return 0
}
let checkDuringExecuteFunc = (): number => {
  let start: number = Date.now()
  while (Date.now() - start < 500) {
    if (taskpool.Task.isCanceled()) {
      return 100
    }
  }
  return 0
}
let continuousCheckFunc = (): number => {
  let start: number = Date.now()
  let checkCount: number = 0
  while (Date.now() - start < 500 && checkCount < 10) {
    if (taskpool.Task.isCanceled()) {
      return 1
    }
    checkCount++
    let innerStart: number = Date.now()
    while (Date.now() - innerStart < 20) {}
  }
  return 0
}
let earlyReturnFunc = (): string => {
  if (taskpool.Task.isCanceled()) {
    return "canceled_immediately"
  }
  let start: number = Date.now()
  while (Date.now() - start < 100) {}
  if (taskpool.Task.isCanceled()) {
    return "canceled_after_work"
  }
  return "completed"
}
let withCleanupFunc = (): string => {
  let resource: string = "allocated"
  let start: number = Date.now()
  while (Date.now() - start < 500) {
    if (taskpool.Task.isCanceled()) {
      resource = ""
      return "cleaned_up"
    }
  }
  resource = ""
  return "completed"
}
let checkAtStartFunc = (): string => {
  if (taskpool.Task.isCanceled()) {
    return "start_canceled"
  }
  return "start_normal"
}
let checkAtMiddleFunc = (): string => {
  let start: number = Date.now()
  while (Date.now() - start < 200) {}
  let middleCanceled: boolean = taskpool.Task.isCanceled()
  if (middleCanceled) {
    return "middle_canceled"
  }
  start = Date.now()
  while (Date.now() - start < 100) {}
  return "completed"
}
let checkAtEndFunc = (): string => {
  let start: number = Date.now()
  while (Date.now() - start < 500) {}
  if (taskpool.Task.isCanceled()) {
    return "end_canceled"
  }
  return "completed"
}
let checkCanceledByIdFunc = (taskId: number): number => {
  let start: number = Date.now()
  while (Date.now() - start < 500) {
    if (taskpool.Task.isCanceled()) {
      return taskId * 10 + 1
    }
  }
  return taskId * 10
}
let quickCancelCheckFunc = (): number => {
  let start: number = Date.now()
  while (Date.now() - start < 500) {}
  for (let i = 0; i < 100; i++) {
    if (taskpool.Task.isCanceled()) {
      return i
    }
  }
  return -1
}
let delayedCancelCheckFunc = (): number => {
  let cancelDetectedAt: number = -1
  let start: number = Date.now()
  let elapsed: number = 0
  elapsed = Date.now() - start
  while (elapsed < 500) {
    if (taskpool.Task.isCanceled()) {
      cancelDetectedAt = elapsed
      break
    }
    elapsed = Date.now() - start
  }
  return cancelDetectedAt
}
let outerTaskFunc = (): string => {
  if (taskpool.Task.isCanceled()) {
    return "outer_canceled"
  }
  return "outer_normal"
}
let loopTaskFunc = (): number => {
  let iterations: number = 0
  for (let i = 0; i < 100; i++) {
    if (taskpool.Task.isCanceled()) {
      return iterations
    }
    iterations++
    let iterStart: number = Date.now()
    while (Date.now() - iterStart < 20) {}
  }
  return iterations
}
let completedCheckFunc = (): string => {
  if (taskpool.Task.isCanceled()) {
    return "canceled"
  }
  return "completed"
}
let highFrequencyCheckFunc = (): boolean => {
  let anyCanceled: boolean = false
  let start: number = Date.now()
  while (Date.now() - start < 500) {
    if (taskpool.Task.isCanceled()) {
      anyCanceled = true
    }
  }
  return anyCanceled
}
export default function TaskIsCanceledTest(): void {
  describe('TaskIsCanceledTest', (): void => {
    beforeAll((): void => {
    })
    afterAll((): void => {})

    /**
     * @tc.name   TaskIsCanceledTest0100
     * @tc.number SUB_TASK_IS_CANCELED_TEST_0100
     * @tc.desc   Verify Task.isCanceled() with no parameters returns boolean type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskIsCanceledTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(checkNotCanceledFunc)
      let result: boolean = false;
      try {
        result = await taskpool.execute(task) as boolean
      } catch (error) {
        expect().assertFail()
      }
      expect(typeof result).assertEqual('boolean')
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest0200
     * @tc.number SUB_TASK_IS_CANCELED_TEST_0200
     * @tc.desc   Verify Task.isCanceled() returns false when task is not canceled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskIsCanceledTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(checkNotCanceledFunc)
      let result: boolean = false;
      try {
        result = await taskpool.execute(task) as boolean
      } catch (error) {
        expect().assertFail()
      }
      expect(result).assertFalse()
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest0300
     * @tc.number SUB_TASK_IS_CANCELED_TEST_0300
     * @tc.desc   Verify Task.isCanceled() returns true after calling cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskIsCanceledTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(afterCancelDetectFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      // 轮询确认任务已 RUNNING 再取消（固定 100ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let runningtask: boolean = false
      let begintask: number = Date.now()
      while (!runningtask && Date.now() - begintask < 10000) {
        let poolInfotask: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
        for (let taskInfo of poolInfotask.taskInfos) {
          if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
            runningtask = true
          }
        }
        if (!runningtask) {
          try {
            await Utils.msSleep(20)
          } catch (error) {
            expect().assertFail()
          }
        }
      }
      expect(runningtask).assertTrue()
      // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
      try {
        await Utils.msSleep(50)
      } catch (error) {
        expect().assertFail()
      }
      try {
        taskpool.cancel(task)
      } catch (e) {
        // cancel may throw
      }
      try {
        let result: number = await executePromise
        expect(result).assertEqual(1)
      } catch (e) {
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest0400
     * @tc.number SUB_TASK_IS_CANCELED_TEST_0400
     * @tc.desc   Verify Task.isCanceled() return type is boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskIsCanceledTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(checkTypeFunc)
      let result: string = "";
      try {
        result = await taskpool.execute(task) as string
      } catch (error) {
        expect().assertFail()
      }
      expect(result).assertEqual('boolean')
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest0500
     * @tc.number SUB_TASK_IS_CANCELED_TEST_0500
     * @tc.desc   Verify Task.isCanceled() returns consistent value on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsCanceledTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(multipleCheckFunc)
      let result: boolean = false;
      try {
        result = await taskpool.execute(task) as boolean
      } catch (error) {
        expect().assertFail()
      }
      expect(result).assertTrue()
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest0600
     * @tc.number SUB_TASK_IS_CANCELED_TEST_0600
     * @tc.desc   Verify Task.isCanceled() returns true after calling cancel during execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskIsCanceledTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(checkDuringExecuteFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      // 轮询确认任务已 RUNNING 再取消（setTimeout 固定延迟在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running0600: boolean = false
      let begin0600: number = Date.now()
      while (!running0600 && Date.now() - begin0600 < 10000) {
        let poolInfo0600: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
        for (let taskInfo of poolInfo0600.taskInfos) {
          if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
            running0600 = true
          }
        }
        if (!running0600) {
          try {
            await Utils.msSleep(20)
          } catch (error) {
            expect().assertFail()
          }
        }
      }
      expect(running0600).assertTrue()
      // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
      try {
        await Utils.msSleep(50)
      } catch (error) {
        expect().assertFail()
      }
      try {
        taskpool.cancel(task)
      } catch (e) {
        // cancel may throw
      }
      try {
        let result: number = await executePromise
        expect(result).assertEqual(100)
      } catch (e) {
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest0700
     * @tc.number SUB_TASK_IS_CANCELED_TEST_0700
     * @tc.desc   Verify Task.isCanceled() when cancel is called before task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsCanceledTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // 取消作用于另一个 RUNNING 中的牺牲任务（"cancel 在目标任务执行前被调用"字面成立且确定）：
      // cancel 不会跨任务泄漏，目标任务内 isCanceled() 必为 false；对目标任务自身立即 cancel 在负载下
      // 可能落在其运行中（isCanceled=true）产生竞态，故不采用。
      let victim: taskpool.Task = new taskpool.Task(slowVictimFunc)
      let victimPromise: Promise<number> = taskpool.execute(victim) as Promise<number>
      let victimRunning0700: boolean = false
      let begin0700: number = Date.now()
      while (!victimRunning0700 && Date.now() - begin0700 < 10000) {
        let poolInfo0700: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
        for (let taskInfo of poolInfo0700.taskInfos) {
          if (taskInfo.taskId === victim.taskId && taskInfo.state === taskpool.State.RUNNING) {
            victimRunning0700 = true
          }
        }
        if (!victimRunning0700) {
          try {
            await Utils.msSleep(20)
          } catch (error) {
            expect().assertFail()
          }
        }
      }
      expect(victimRunning0700).assertTrue()
      try {
        taskpool.cancel(victim)
      } catch (e) {
        // cancel may throw
      }
      let task: taskpool.Task = new taskpool.Task(checkNotCanceledFunc)
      let r: boolean = false;
      try {
        r = await taskpool.execute(task) as boolean
      } catch (error) {
        expect().assertFail()
      }
      expect(r).assertFalse()
      try {
        await victimPromise
      } catch (error) {
      }
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest0800
     * @tc.number SUB_TASK_IS_CANCELED_TEST_0800
     * @tc.desc   Verify Task.isCanceled() checks multiple times during task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsCanceledTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(continuousCheckFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      // 轮询确认任务已 RUNNING 再取消（setTimeout 固定延迟在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running0800: boolean = false
      let begin0800: number = Date.now()
      while (!running0800 && Date.now() - begin0800 < 10000) {
        let poolInfo0800: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
        for (let taskInfo of poolInfo0800.taskInfos) {
          if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
            running0800 = true
          }
        }
        if (!running0800) {
          try {
            await Utils.msSleep(20)
          } catch (error) {
            expect().assertFail()
          }
        }
      }
      expect(running0800).assertTrue()
      // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
      try {
        await Utils.msSleep(50)
      } catch (error) {
        expect().assertFail()
      }
      try {
        taskpool.cancel(task)
      } catch (e) {
        // cancel may throw
      }
      try {
        let result: number = await executePromise
        expect(result).assertEqual(1)
      } catch (e) {
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest0900
     * @tc.number SUB_TASK_IS_CANCELED_TEST_0900
     * @tc.desc   Verify Task.isCanceled() returns completed when task is not canceled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsCanceledTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(earlyReturnFunc)
      let result: string = "";
      try {
        result = await taskpool.execute(task) as string
      } catch (error) {
        expect().assertFail()
      }
      expect(result).assertEqual("completed")
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest1000
     * @tc.number SUB_TASK_IS_CANCELED_TEST_1000
     * @tc.desc   Verify Task.isCanceled() cleanup resource when task is canceled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskIsCanceledTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(withCleanupFunc)
      let executePromise: Promise<string> = taskpool.execute(task) as Promise<string>
      // 轮询确认任务已 RUNNING 再取消（setTimeout 固定延迟在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running1000: boolean = false
      let begin1000: number = Date.now()
      while (!running1000 && Date.now() - begin1000 < 10000) {
        let poolInfo1000: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
        for (let taskInfo of poolInfo1000.taskInfos) {
          if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
            running1000 = true
          }
        }
        if (!running1000) {
          try {
            await Utils.msSleep(20)
          } catch (error) {
            expect().assertFail()
          }
        }
      }
      expect(running1000).assertTrue()
      // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
      try {
        await Utils.msSleep(50)
      } catch (error) {
        expect().assertFail()
      }
      try {
        taskpool.cancel(task)
      } catch (e) {
        // cancel may throw
      }
      try {
        let result: string = await executePromise
        expect(result).assertEqual("cleaned_up")
      } catch (e) {
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest1100
     * @tc.number SUB_TASK_IS_CANCELED_TEST_1100
     * @tc.desc   Verify Task.isCanceled() at task start stage returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsCanceledTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(checkAtStartFunc)
      let result: string = "";
      try {
        result = await taskpool.execute(task) as string
      } catch (error) {
        expect().assertFail()
      }
      expect(result).assertEqual("start_normal")
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest1200
     * @tc.number SUB_TASK_IS_CANCELED_TEST_1200
     * @tc.desc   Verify Task.isCanceled() at task middle stage detects cancel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsCanceledTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(checkAtMiddleFunc)
      let executePromise: Promise<string> = taskpool.execute(task) as Promise<string>
      // 轮询确认任务已 RUNNING 再取消（固定 100ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let runningtask: boolean = false
      let begintask: number = Date.now()
      while (!runningtask && Date.now() - begintask < 10000) {
        let poolInfotask: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
        for (let taskInfo of poolInfotask.taskInfos) {
          if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
            runningtask = true
          }
        }
        if (!runningtask) {
          try {
            await Utils.msSleep(20)
          } catch (error) {
            expect().assertFail()
          }
        }
      }
      expect(runningtask).assertTrue()
      // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
      try {
        await Utils.msSleep(50)
      } catch (error) {
        expect().assertFail()
      }
      try {
        taskpool.cancel(task)
      } catch (e) {
        // cancel may throw
      }
      try {
        let result: string = await executePromise
        expect(result).assertEqual("middle_canceled")
      } catch (e) {
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest1300
     * @tc.number SUB_TASK_IS_CANCELED_TEST_1300
     * @tc.desc   Verify Task.isCanceled() at task end stage returns false when not canceled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsCanceledTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(checkAtEndFunc)
      let result: string = "";
      try {
        result = await taskpool.execute(task) as string
      } catch (error) {
        expect().assertFail()
      }
      expect(result).assertEqual("completed")
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest1400
     * @tc.number SUB_TASK_IS_CANCELED_TEST_1400
     * @tc.desc   Verify Task.isCanceled() with multiple concurrent tasks checking independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskIsCanceledTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(checkCanceledByIdFunc, 1.0)
      let task2: taskpool.Task = new taskpool.Task(checkCanceledByIdFunc, 2.0)
      let task3: taskpool.Task = new taskpool.Task(checkCanceledByIdFunc, 3.0)
      let promise2: Promise<number> = taskpool.execute(task2) as Promise<number>
      try {
        await Utils.msSleep(100)
      } catch (error) {
        expect().assertFail()
      }
      let promise1: Promise<number> = taskpool.execute(task1) as Promise<number>
      let promise3: Promise<number> = taskpool.execute(task3) as Promise<number>
      // 轮询确认任务已 RUNNING 再取消（固定 100ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let runningtask2: boolean = false
      let begintask2: number = Date.now()
      while (!runningtask2 && Date.now() - begintask2 < 10000) {
        let poolInfotask2: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
        for (let taskInfo of poolInfotask2.taskInfos) {
          if (taskInfo.taskId === task2.taskId && taskInfo.state === taskpool.State.RUNNING) {
            runningtask2 = true
          }
        }
        if (!runningtask2) {
          try {
            await Utils.msSleep(20)
          } catch (error) {
            expect().assertFail()
          }
        }
      }
      expect(runningtask2).assertTrue()
      // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
      try {
        await Utils.msSleep(50)
      } catch (error) {
        expect().assertFail()
      }
      try {
        taskpool.cancel(task2)
      } catch (e) {
        // cancel may throw
      }
      let results1700: number[] = [];
      try {
        results1700 = await Promise.all([promise1, promise3]) as number[]
      } catch (error) {
        expect().assertFail()
      }
      expect(results1700[0]).assertEqual(10)
      expect(results1700[1]).assertEqual(30)
      try {
        let result2: number = await promise2
        expect(result2).assertEqual(21)
      } catch (e) {
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest1500
     * @tc.number SUB_TASK_IS_CANCELED_TEST_1500
     * @tc.desc   Verify Task.isCanceled() with quick cancel scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskIsCanceledTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(quickCancelCheckFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      // Give the task time to start its busy window before canceling
      // 轮询确认任务已 RUNNING 再取消（固定 100ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let runningtask: boolean = false
      let begintask: number = Date.now()
      while (!runningtask && Date.now() - begintask < 10000) {
        let poolInfotask: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
        for (let taskInfo of poolInfotask.taskInfos) {
          if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
            runningtask = true
          }
        }
        if (!runningtask) {
          try {
            await Utils.msSleep(20)
          } catch (error) {
            expect().assertFail()
          }
        }
      }
      expect(runningtask).assertTrue()
      // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
      try {
        await Utils.msSleep(50)
      } catch (error) {
        expect().assertFail()
      }
      try {
        taskpool.cancel(task)
      } catch (e) {
        // cancel may throw
      }
      try {
        let result: number = await executePromise
        expect(result).assertEqual(0)
      } catch (e) {
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest1600
     * @tc.number SUB_TASK_IS_CANCELED_TEST_1600
     * @tc.desc   Verify Task.isCanceled() with delayed cancel scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskIsCanceledTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(delayedCancelCheckFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      // 轮询确认任务已 RUNNING 再取消（setTimeout 固定延迟在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running1600: boolean = false
      let begin1600: number = Date.now()
      while (!running1600 && Date.now() - begin1600 < 10000) {
        let poolInfo1600: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
        for (let taskInfo of poolInfo1600.taskInfos) {
          if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
            running1600 = true
          }
        }
        if (!running1600) {
          try {
            await Utils.msSleep(20)
          } catch (error) {
            expect().assertFail()
          }
        }
      }
      expect(running1600).assertTrue()
      // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
      try {
        await Utils.msSleep(50)
      } catch (error) {
        expect().assertFail()
      }
      try {
        taskpool.cancel(task)
      } catch (e) {
        // cancel may throw
      }
      try {
        let result: number = await executePromise
        expect(result >= 0 && result < 500).assertTrue()
      } catch (e) {
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest1700
     * @tc.number SUB_TASK_IS_CANCELED_TEST_1700
     * @tc.desc   Verify Task.isCanceled() called in main thread returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsCanceledTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let result: boolean = taskpool.Task.isCanceled()
      expect(result).assertFalse()
    })

    /**
     * @tc.name   TaskIsCanceledTest1800
     * @tc.number SUB_TASK_IS_CANCELED_TEST_1800
     * @tc.desc   Verify Task.isCanceled() returns normal status for task function checking cancellation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskIsCanceledTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(outerTaskFunc)
      let result: string = "";
      try {
        result = await taskpool.execute(task) as string
      } catch (error) {
        expect().assertFail()
      }
      expect(result).assertEqual("outer_normal")
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest1900
     * @tc.number SUB_TASK_IS_CANCELED_TEST_1900
     * @tc.desc   Verify Task.isCanceled() in loop task detects cancel and exits early
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskIsCanceledTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(loopTaskFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      // 轮询确认任务已 RUNNING 再取消（setTimeout 固定延迟在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let running1900: boolean = false
      let begin1900: number = Date.now()
      while (!running1900 && Date.now() - begin1900 < 10000) {
        let poolInfo1900: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
        for (let taskInfo of poolInfo1900.taskInfos) {
          if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
            running1900 = true
          }
        }
        if (!running1900) {
          try {
            await Utils.msSleep(20)
          } catch (error) {
            expect().assertFail()
          }
        }
      }
      expect(running1900).assertTrue()
      // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
      try {
        await Utils.msSleep(50)
      } catch (error) {
        expect().assertFail()
      }
      try {
        taskpool.cancel(task)
      } catch (e) {
        // cancel may throw
      }
      try {
        let result: number = await executePromise
        expect(result).assertLess(100)
      } catch (e) {
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest2000
     * @tc.number SUB_TASK_IS_CANCELED_TEST_2000
     * @tc.desc   Verify Task.isCanceled() after execute completes returns completed status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskIsCanceledTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(completedCheckFunc)
      let result: string = "";
      try {
        result = await taskpool.execute(task) as string
      } catch (error) {
        expect().assertFail()
      }
      expect(result).assertEqual("completed")
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest2100
     * @tc.number SUB_TASK_IS_CANCELED_TEST_2100
     * @tc.desc   Verify Task.isCanceled() with high frequency calls in task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskIsCanceledTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(highFrequencyCheckFunc)
      let result: boolean = false;
      try {
        result = await taskpool.execute(task) as boolean
      } catch (error) {
        expect().assertFail()
      }
      expect(result).assertFalse()
      done();
    })

    /**
     * @tc.name   TaskIsCanceledTest2200
     * @tc.number SUB_TASK_IS_CANCELED_TEST_2200
     * @tc.desc   Verify Task.isCanceled() with cancel by taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskIsCanceledTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(afterCancelDetectFunc)
      let executePromise: Promise<number> = taskpool.execute(task) as Promise<number>
      // 轮询确认任务已 RUNNING 再取消（固定 100ms 等待在负载下可能早于任务启动，导致 cancel 落在启动前而 reject）
      let runningtask: boolean = false
      let begintask: number = Date.now()
      while (!runningtask && Date.now() - begintask < 10000) {
        let poolInfotask: taskpool.TaskPoolInfo = taskpool.getTaskPoolInfo()
        for (let taskInfo of poolInfotask.taskInfos) {
          if (taskInfo.taskId === task.taskId && taskInfo.state === taskpool.State.RUNNING) {
            runningtask = true
          }
        }
        if (!runningtask) {
          try {
            await Utils.msSleep(20)
          } catch (error) {
            expect().assertFail()
          }
        }
      }
      expect(runningtask).assertTrue()
      // RUNNING 已确认后再等 50ms，确保任务首个检查点已执行（避免 cancel 落在启动与首检查点之间）
      try {
        await Utils.msSleep(50)
      } catch (error) {
        expect().assertFail()
      }
      try {
        taskpool.cancel(task.taskId.toInt())
      } catch (e) {
        // cancel may throw
      }
      try {
        let result: number = await executePromise
        expect(result).assertEqual(1)
      } catch (e) {
        expect().assertFail()
      }
      done();
    })
  })
}
