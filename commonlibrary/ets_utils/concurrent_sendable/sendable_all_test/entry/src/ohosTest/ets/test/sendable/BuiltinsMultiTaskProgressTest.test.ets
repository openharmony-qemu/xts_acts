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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils, collections } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class MultiTaskProgress {
  public taskProgress_: collections.Map<string, number>

  public taskStatus_: collections.Map<string, string>

  public totalTasks_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(taskProgress_: collections.Map<string, number>, taskStatus_: collections.Map<string, string>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.taskProgress_ = taskProgress_
    this.taskStatus_ = taskStatus_
    this.lock_ = lock_
  }


  async setTotalTasks(total: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.totalTasks_ = total
      this.taskProgress_.clear()
      this.taskStatus_.clear()
    })
  }

  async registerTask(taskId: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.taskProgress_.set(taskId, 0)
      this.taskStatus_.set(taskId, 'pending')
    })
  }

  async updateTaskProgress(taskId: string, progress: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      if (this.taskProgress_.has(taskId)) {
        this.taskProgress_.set(taskId, Math.min(100, progress))
        if (progress >= 100) {
          this.taskStatus_.set(taskId, 'completed')
        } else if (progress > 0) {
          this.taskStatus_.set(taskId, 'running')
        }
      }
    })
  }

  async markTaskFailed(taskId: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.taskStatus_.set(taskId, 'failed')
    })
  }

  async getTaskProgress(taskId: string): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      return this.taskProgress_.get(taskId) ?? 0
    })
  }

  async getTaskStatus(taskId: string): Promise<string> {
    return await this.lock_.lockAsync((): string => {
      return this.taskStatus_.get(taskId) ?? 'unknown'
    })
  }

  async getOverallProgress(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      if (this.totalTasks_ === 0) return 0
      let totalProgress: number = 0
      this.taskProgress_.forEach((value: number) => {
        totalProgress += value
      })
      return Math.floor(totalProgress / this.totalTasks_)
    })
  }

  async getCompletedCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      let count: number = 0
      this.taskStatus_.forEach((status: string) => {
        if (status === 'completed') count++
      })
      return count
    })
  }

  async getFailedCount(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      let count: number = 0
      this.taskStatus_.forEach((status: string) => {
        if (status === 'failed') count++
      })
      return count
    })
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.taskProgress_.clear()
      this.taskStatus_.clear()
      this.totalTasks_ = 0
    })
  }
}

@Concurrent
async function taskProgressUpdateTask(mtp: MultiTaskProgress, taskId: string): Promise<void> {
  return await mtp.lock_.lockAsync((): void => {
    mtp.taskProgress_.set(taskId, 100)
    mtp.taskStatus_.set(taskId, 'completed')

  })
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsMultiTaskProgressTest(): void {
  describe('BuiltinsMultiTaskProgressTest', () => {
    let mtp: MultiTaskProgress

    beforeEach(async (): Promise<void> => {
      mtp = new MultiTaskProgress(new collections.Map<string, number>(), new collections.Map<string, string>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await mtp.reset()
    })

    /** @tc.level  LEVEL0 */
    it('testMultiTaskProgress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await mtp.setTotalTasks(3)
      await mtp.registerTask('task_1')
      expect(await mtp.getTaskProgress('task_1')).assertEqual(0)
      expect(await mtp.getTaskStatus('task_1')).assertEqual('pending')
    })

    /** @tc.level  LEVEL0 */
    it('testMultiTaskProgress0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await mtp.setTotalTasks(3)
      await mtp.registerTask('task_1')
      await mtp.updateTaskProgress('task_1', 50)
      expect(await mtp.getTaskProgress('task_1')).assertEqual(50)
      expect(await mtp.getTaskStatus('task_1')).assertEqual('running')
    })

    /** @tc.level  LEVEL0 */
    it('testMultiTaskProgress0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await mtp.setTotalTasks(3)
      await mtp.registerTask('task_1')
      await mtp.updateTaskProgress('task_1', 100)
      expect(await mtp.getTaskProgress('task_1')).assertEqual(100)
      expect(await mtp.getTaskStatus('task_1')).assertEqual('completed')
    })

    /** @tc.level  LEVEL0 */
    it('testMultiTaskProgress0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await mtp.setTotalTasks(3)
      await mtp.registerTask('task_1')
      await mtp.markTaskFailed('task_1')
      expect(await mtp.getTaskStatus('task_1')).assertEqual('failed')
    })

    /** @tc.level  LEVEL2 */
    it('testMultiTaskProgress0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await mtp.setTotalTasks(5)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        await mtp.registerTask(`task_${i}`)
        tasks.push(new taskpool.Task(taskProgressUpdateTask, mtp, `task_${i}`))
      }
      await executeTasksGetObjects(tasks)
      expect(await mtp.getCompletedCount()).assertEqual(5)
    })

    /** @tc.level  LEVEL0 */
    it('testMultiTaskProgress0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await mtp.setTotalTasks(3)
      await mtp.registerTask('task_0')
      await mtp.registerTask('task_1')
      await mtp.registerTask('task_2')
      await mtp.updateTaskProgress('task_0', 100)
      await mtp.updateTaskProgress('task_1', 50)
      await mtp.updateTaskProgress('task_2', 0)
      expect(await mtp.getOverallProgress()).assertEqual(50)
    })

    /** @tc.level  LEVEL1 */
    it('testMultiTaskProgress0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await mtp.setTotalTasks(3)
      await mtp.registerTask('task_0')
      await mtp.registerTask('task_1')
      await mtp.registerTask('task_2')
      await mtp.updateTaskProgress('task_0', 100)
      await mtp.updateTaskProgress('task_1', 100)
      await mtp.markTaskFailed('task_2')
      expect(await mtp.getCompletedCount()).assertEqual(2)
      expect(await mtp.getFailedCount()).assertEqual(1)
    })

    /** @tc.level  LEVEL1 */
    it('testMultiTaskProgress0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await mtp.setTotalTasks(2)
      await mtp.registerTask('task_0')
      await mtp.registerTask('task_1')
      await mtp.updateTaskProgress('task_0', 150)
      expect(await mtp.getTaskProgress('task_0')).assertEqual(100)
    })

    /** @tc.level  LEVEL1 */
    it('testMultiTaskProgress0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await mtp.setTotalTasks(0)
      expect(await mtp.getOverallProgress()).assertEqual(0)
    })

    /** @tc.level  LEVEL2 */
    it('testMultiTaskProgress1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await mtp.setTotalTasks(10)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        await mtp.registerTask(`task_${i}`)
        tasks.push(new taskpool.Task(taskProgressUpdateTask, mtp, `task_${i}`))
      }
      await executeTasksGetObjects(tasks)
      expect(await mtp.getCompletedCount()).assertEqual(10)
      expect(await mtp.getOverallProgress()).assertEqual(100)
    })

    /** @tc.level  LEVEL1 */
    it('testMultiTaskProgress1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await mtp.setTotalTasks(2)
      await mtp.registerTask('task_0')
      await mtp.updateTaskProgress('task_0', 100)
      await mtp.reset()
      expect(await mtp.getOverallProgress()).assertEqual(0)
    })

    /** @tc.level  LEVEL1 */
    it('testMultiTaskProgress1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await mtp.setTotalTasks(3)
      await mtp.registerTask('task_0')
      expect(await mtp.getTaskProgress('unknown')).assertEqual(0)
      expect(await mtp.getTaskStatus('unknown')).assertEqual('unknown')
    })
  })
}
