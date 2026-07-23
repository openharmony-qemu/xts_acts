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
class BatchProgressTracker {
  public current_: number = 0
  public total_: number = 0
  public percentage_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async setTotal(total: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.total_ = total
      this.current_ = 0
      this.percentage_ = 0
    })
  }

  async increment(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      if (this.current_ < this.total_) {
        this.current_++
        this.percentage_ = Math.floor((this.current_ / this.total_) * 100)
      }
      return this.percentage_
    })
  }

  async addProgress(value: number): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      this.current_ += value
      if (this.current_ > this.total_) {
        this.current_ = this.total_
      }
      this.percentage_ = Math.floor((this.current_ / this.total_) * 100)
      return this.percentage_
    })
  }

  async getPercentage(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.percentage_)
  }

  async getCurrent(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.current_)
  }

  async getTotal(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.total_)
  }

  async isCompleted(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.current_ >= this.total_)
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.current_ = 0
      this.total_ = 0
      this.percentage_ = 0
    })
  }
}

@Concurrent
async function batchIncrementTask(tracker: BatchProgressTracker): Promise<void> {
  await tracker.increment()
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsBatchProgressTest(): void {
  describe('BuiltinsBatchProgressTest', () => {
    let tracker: BatchProgressTracker

    beforeEach(async (): Promise<void> => {
      tracker = new BatchProgressTracker(new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await tracker.reset()
    })

    /** @tc.level  LEVEL0 */
    it('testBatchProgress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await tracker.setTotal(10)
      expect(await tracker.getPercentage()).assertEqual(0)
      expect(await tracker.getCurrent()).assertEqual(0)
      expect(await tracker.getTotal()).assertEqual(10)
    })

    /** @tc.level  LEVEL0 */
    it('testBatchProgress0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await tracker.setTotal(10)
      const p1: number = await tracker.increment()
      expect(p1).assertEqual(10)
      const p2: number = await tracker.increment()
      expect(p2).assertEqual(20)
      expect(await tracker.getCurrent()).assertEqual(2)
    })

    /** @tc.level  LEVEL0 */
    it('testBatchProgress0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await tracker.setTotal(10)
      for (let i: number = 0; i < 5; i++) {
        await tracker.increment()
      }
      expect(await tracker.getPercentage()).assertEqual(50)
      expect(await tracker.getCurrent()).assertEqual(5)
    })

    /** @tc.level  LEVEL0 */
    it('testBatchProgress0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await tracker.setTotal(5)
      for (let i: number = 0; i < 5; i++) {
        await tracker.increment()
      }
      expect(await tracker.getPercentage()).assertEqual(100)
      expect(await tracker.isCompleted()).assertTrue()
    })

    /** @tc.level  LEVEL1 */
    it('testBatchProgress0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await tracker.setTotal(10)
      for (let i: number = 0; i < 15; i++) {
        await tracker.increment()
      }
      expect(await tracker.getPercentage()).assertEqual(100)
      expect(await tracker.getCurrent()).assertEqual(10)
    })

    /** @tc.level  LEVEL1 */
    it('testBatchProgress0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await tracker.setTotal(0)
      expect(await tracker.getPercentage()).assertEqual(0)
    })

    /** @tc.level  LEVEL0 */
    it('testBatchProgress0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await tracker.setTotal(1)
      expect(await tracker.getPercentage()).assertEqual(0)
      await tracker.increment()
      expect(await tracker.getPercentage()).assertEqual(100)
      expect(await tracker.isCompleted()).assertTrue()
    })

    /** @tc.level  LEVEL2 */
    it('testBatchProgress0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await tracker.setTotal(5)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(batchIncrementTask, tracker))
      }
      await executeTasksGetObjects(tasks)
      expect(await tracker.getCurrent()).assertEqual(5)
      expect(await tracker.getPercentage()).assertEqual(100)
      expect(await tracker.isCompleted()).assertTrue()
    })

    /** @tc.level  LEVEL2 */
    it('testBatchProgress0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await tracker.setTotal(20)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 20; i++) {
        tasks.push(new taskpool.Task(batchIncrementTask, tracker))
      }
      await executeTasksGetObjects(tasks)
      expect(await tracker.getCurrent()).assertEqual(20)
      expect(await tracker.getPercentage()).assertEqual(100)
    })

    /** @tc.level  LEVEL1 */
    it('testBatchProgress1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await tracker.setTotal(5)
      for (let i: number = 0; i < 5; i++) {
        await tracker.increment()
      }
      expect(await tracker.getPercentage()).assertEqual(100)
      await tracker.reset()
      expect(await tracker.getPercentage()).assertEqual(0)
      expect(await tracker.getCurrent()).assertEqual(0)
      await tracker.setTotal(3)
      for (let i: number = 0; i < 3; i++) {
        await tracker.increment()
      }
      expect(await tracker.getPercentage()).assertEqual(100)
    })

    /** @tc.level  LEVEL1 */
    it('testBatchProgress1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await tracker.reset()
      expect(await tracker.getPercentage()).assertEqual(0)
      await tracker.reset()
      expect(await tracker.getPercentage()).assertEqual(0)
    })

    /** @tc.level  LEVEL3 */
    it('testBatchProgress1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await tracker.setTotal(100)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 100; i++) {
        tasks.push(new taskpool.Task(batchIncrementTask, tracker))
      }
      await executeTasksGetObjects(tasks)
      expect(await tracker.getCurrent()).assertEqual(100)
      expect(await tracker.getPercentage()).assertEqual(100)
    })
  })
}
