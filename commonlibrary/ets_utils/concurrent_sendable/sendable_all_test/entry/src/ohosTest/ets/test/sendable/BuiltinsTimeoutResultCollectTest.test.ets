/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { collections, ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class TimeoutResultCollector {
  public pendingTasks_: collections.Map<number, string>

  public completedTasks_: collections.Map<number, string>

  public timeoutTasks_: collections.Map<number, string>

  public timeoutTimes_: collections.Map<number, number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(pendingTasks_: collections.Map<number, string>, completedTasks_: collections.Map<number, string>, timeoutTasks_: collections.Map<number, string>, timeoutTimes_: collections.Map<number, number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.pendingTasks_ = pendingTasks_
    this.completedTasks_ = completedTasks_
    this.timeoutTasks_ = timeoutTasks_
    this.timeoutTimes_ = timeoutTimes_
    this.lock_ = lock_
  }


  addPendingTask(taskId: number, taskName: string): void {
    this.pendingTasks_.set(taskId, taskName)
  }

  async markCompleted(taskId: number, result: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.completedTasks_.set(taskId, result)
      this.pendingTasks_.delete(taskId)
    })
  }

  markTimeout(taskId: number): void {
    const taskName: string | undefined = this.pendingTasks_.get(taskId)
    this.timeoutTasks_.set(taskId, taskName ?? '')
    this.timeoutTimes_.set(taskId, Date.now())
    this.pendingTasks_.delete(taskId)
  }

  getPendingCount(): number {
    return this.pendingTasks_.size
  }

  getCompletedCount(): number {
    return this.completedTasks_.size
  }

  getTimeoutCount(): number {
    return this.timeoutTasks_.size
  }

  getCompletedResult(taskId: number): string | undefined {
    return this.completedTasks_.get(taskId)
  }

  getTimeoutTime(taskId: number): number | undefined {
    return this.timeoutTimes_.get(taskId)
  }

  getPendingTaskIds(): number[] {
    const ids: number[] = []
    this.pendingTasks_.forEach((value: string, key: number): void => {
      ids.push(key)
    })
    return ids
  }

  getCompletedTaskIds(): number[] {
    const ids: number[] = []
    this.completedTasks_.forEach((value: string, key: number): void => {
      ids.push(key)
    })
    return ids
  }

  getTimeoutTaskIds(): number[] {
    const ids: number[] = []
    this.timeoutTasks_.forEach((value: string, key: number): void => {
      ids.push(key)
    })
    return ids
  }

  async clear(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.pendingTasks_.clear()
      this.completedTasks_.clear()
      this.timeoutTasks_.clear()
      this.timeoutTimes_.clear()
    })
  }
}

@Concurrent
function quickTask(taskId: number): string {
  return `result_${taskId}`
}

export default function BuiltinsTimeoutResultCollectTest(): void {
  describe('BuiltinsTimeoutResultCollectTest', (): void => {
    let collector: TimeoutResultCollector

    beforeEach((): void => {
      collector = new TimeoutResultCollector(new collections.Map<number, string>(), new collections.Map<number, string>(), new collections.Map<number, string>(), new collections.Map<number, number>(), new ArkTSUtils.locks.AsyncLock())
    })
    it('testTimeoutResultCollect0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      collector.addPendingTask(1, 'task_1')
      expect(collector.getPendingCount()).assertEqual(1)
    })

    it('testTimeoutResultCollect0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      collector.addPendingTask(1, 'task_1')
      await collector.markCompleted(1, 'result_1')
      expect(collector.getCompletedCount()).assertEqual(1)
      expect(collector.getPendingCount()).assertEqual(0)
    })

    it('testTimeoutResultCollect0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      collector.addPendingTask(1, 'task_1')
      collector.markTimeout(1)
      expect(collector.getTimeoutCount()).assertEqual(1)
      expect(collector.getPendingCount()).assertEqual(0)
    })

    it('testTimeoutResultCollect0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      collector.addPendingTask(1, 'task_1')
      const beforeTimeout: number = Date.now()
      collector.markTimeout(1)
      const afterTimeout: number = Date.now()
      const timeoutTime: number | undefined = collector.getTimeoutTime(1)
      expect(timeoutTime !== undefined).assertTrue()
      if (timeoutTime !== undefined) {
        expect(timeoutTime >= beforeTimeout).assertTrue()
        expect(timeoutTime <= afterTimeout).assertTrue()
      }
    })

    it('testTimeoutResultCollect0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      collector.addPendingTask(1, 'quick_task')
      const task = new taskpool.Task(quickTask, 1)
      const result: Object = await taskpool.execute(task)
      await collector.markCompleted(1, result as string)
      expect(collector.getCompletedCount()).assertEqual(1)
      expect(collector.getPendingCount()).assertEqual(0)
      expect(collector.getCompletedResult(1)).assertEqual('result_1')
    })

    it('testTimeoutResultCollect0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      collector.addPendingTask(1, 'task_1')
      const task = new taskpool.Task(quickTask, 1)
      const timeoutPromise: Promise<string> = new Promise<string>((resolve: Function): void => {
        setTimeout((): void => resolve('timeout'), 5000)
      })
      const taskPromise: Promise<Object> = taskpool.execute(task)
      const raceResult: string | Object = await Promise.race([taskPromise, timeoutPromise])
      expect(raceResult).assertEqual('result_1')
    })

    it('testTimeoutResultCollect0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i = 0; i < 5; i++) {
        collector.addPendingTask(i, `task_${i}`)
      }
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(quickTask, i))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        await collector.markCompleted(i, results[i] as string)
      }
      expect(collector.getCompletedCount()).assertEqual(5)
      collector.markTimeout(99)
      expect(collector.getTimeoutCount()).assertEqual(1)
    })

    it('testTimeoutResultCollect0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      collector.addPendingTask(1, 'task_1')
      collector.addPendingTask(2, 'task_2')
      collector.markTimeout(1)
      collector.markTimeout(2)
      const timeoutIds: number[] = collector.getTimeoutTaskIds()
      expect(timeoutIds.length).assertEqual(2)
    })

    it('testTimeoutResultCollect0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      collector.addPendingTask(1, 'task_1')
      collector.addPendingTask(2, 'task_2')
      await collector.markCompleted(1, 'result_1')
      await collector.markCompleted(2, 'result_2')
      const completedIds: number[] = collector.getCompletedTaskIds()
      expect(completedIds.length).assertEqual(2)
    })

    it('testTimeoutResultCollect1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      collector.addPendingTask(1, 'task_1')
      collector.markTimeout(1)
      expect(collector.getPendingCount()).assertEqual(0)
      expect(collector.getTimeoutCount()).assertEqual(1)
      expect(collector.getCompletedCount()).assertEqual(0)
    })

    it('testTimeoutResultCollect1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      collector.addPendingTask(1, 'task_1')
      expect(collector.getPendingCount()).assertEqual(1)
      await collector.markCompleted(1, 'result_1')
      expect(collector.getPendingCount()).assertEqual(0)
    })

    it('testTimeoutResultCollect1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      collector.addPendingTask(1, 'task_1')
      expect(collector.getPendingCount()).assertEqual(1)
      collector.markTimeout(1)
      expect(collector.getPendingCount()).assertEqual(0)
    })

    it('testTimeoutResultCollect1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i = 0; i < 10; i++) {
        collector.addPendingTask(i, `task_${i}`)
      }
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(quickTask, i))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        await collector.markCompleted(i, results[i] as string)
      }
      collector.markTimeout(100)
      collector.markTimeout(101)
      expect(collector.getCompletedCount()).assertEqual(10)
      expect(collector.getTimeoutCount()).assertEqual(2)
    })
  })
}
