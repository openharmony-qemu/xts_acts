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
class UploadProgressTracker {
  public totalChunks_: number = 0
  public completedChunks_: number = 0
  public chunkProgress_: collections.Map<number, number>

  public failedChunks_: collections.Array<number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(chunkProgress_: collections.Map<number, number>, failedChunks_: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.chunkProgress_ = chunkProgress_
    this.failedChunks_ = failedChunks_
    this.lock_ = lock_
  }


  async setTotalChunks(total: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.totalChunks_ = total
      this.completedChunks_ = 0
      this.chunkProgress_.clear()
      while (this.failedChunks_.length > 0) { this.failedChunks_.pop() }
      for (let i: number = 0; i < total; i++) {
        this.chunkProgress_.set(i, 0)
      }
    })
  }

  async updateChunkProgress(chunkIndex: number, progress: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      if (this.chunkProgress_.has(chunkIndex)) {
        const previousProgress: number = this.chunkProgress_.get(chunkIndex) ?? 0
        this.chunkProgress_.set(chunkIndex, Math.min(100, progress))
        if (previousProgress < 100 && progress >= 100) {
          this.completedChunks_++
        }
      }
    })
  }

  async markChunkFailed(chunkIndex: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.failedChunks_.push(chunkIndex)
    })
  }

  async getChunkProgress(chunkIndex: number): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      return this.chunkProgress_.get(chunkIndex) ?? 0
    })
  }

  async getOverallProgress(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      if (this.totalChunks_ === 0) return 0
      let totalProgress: number = 0
      this.chunkProgress_.forEach((value: number) => {
        totalProgress += value
      })
      return Math.floor(totalProgress / this.totalChunks_)
    })
  }

  async getCompletedChunks(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.completedChunks_)
  }

  async getFailedChunks(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.failedChunks_.length)
  }

  async isCompleted(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.completedChunks_ >= this.totalChunks_)
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.totalChunks_ = 0
      this.completedChunks_ = 0
      this.chunkProgress_.clear()
      while (this.failedChunks_.length > 0) { this.failedChunks_.pop() }
    })
  }
}

@Concurrent
async function uploadChunkTask(tracker: UploadProgressTracker, chunkIndex: number): Promise<void> {
  return await tracker.lock_.lockAsync((): void => {
    const previousProgress: number = tracker.chunkProgress_.get(chunkIndex) ?? 0
    tracker.chunkProgress_.set(chunkIndex, 100)
    if (previousProgress < 100) {
      tracker.completedChunks_++
    }

  })
}

function executeTasksGetObjects(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function UploadProgressTest(): void {
  describe('UploadProgressTest', () => {
    let tracker: UploadProgressTracker

    beforeEach(async (): Promise<void> => {
      tracker = new UploadProgressTracker(new collections.Map<number, number>(), new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await tracker.reset()
    })

    /**
     * @tc.name   testUploadProgress0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_UPLOADPROGRESS_TEST_0100
     * @tc.desc   Verify testUploadProgress0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUploadProgress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await tracker.setTotalChunks(1)
      expect(await tracker.getChunkProgress(0)).assertEqual(0)
      expect(await tracker.getOverallProgress()).assertEqual(0)
    })

    /**
     * @tc.name   testUploadProgress0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_UPLOADPROGRESS_TEST_0200
     * @tc.desc   Verify testUploadProgress0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUploadProgress0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await tracker.setTotalChunks(1)
      await tracker.updateChunkProgress(0, 50)
      expect(await tracker.getChunkProgress(0)).assertEqual(50)
      expect(await tracker.getOverallProgress()).assertEqual(50)
    })

    /**
     * @tc.name   testUploadProgress0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_UPLOADPROGRESS_TEST_0300
     * @tc.desc   Verify testUploadProgress0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUploadProgress0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await tracker.setTotalChunks(1)
      await tracker.updateChunkProgress(0, 100)
      await tracker.updateChunkProgress(0, 100)
      expect(await tracker.getChunkProgress(0)).assertEqual(100)
      expect(await tracker.getCompletedChunks()).assertEqual(1)
      expect(await tracker.isCompleted()).assertTrue()
    })

    /**
     * @tc.name   testUploadProgress0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_UPLOADPROGRESS_TEST_0400
     * @tc.desc   Verify testUploadProgress0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUploadProgress0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await tracker.setTotalChunks(5)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(uploadChunkTask, tracker, i))
      }
      await executeTasksGetObjects(tasks)
      expect(await tracker.getCompletedChunks()).assertEqual(5)
      expect(await tracker.isCompleted()).assertTrue()
    })

    /**
     * @tc.name   testUploadProgress0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_UPLOADPROGRESS_TEST_0500
     * @tc.desc   Verify testUploadProgress0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUploadProgress0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await tracker.setTotalChunks(5)
      for (let i: number = 0; i < 5; i++) {
        await tracker.updateChunkProgress(i, 50)
      }
      expect(await tracker.getOverallProgress()).assertEqual(50)
    })

    /**
     * @tc.name   testUploadProgress0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_UPLOADPROGRESS_TEST_0600
     * @tc.desc   Verify testUploadProgress0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUploadProgress0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await tracker.setTotalChunks(3)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(uploadChunkTask, tracker, i))
      }
      await executeTasksGetObjects(tasks)
      expect(await tracker.getOverallProgress()).assertEqual(100)
    })

    /**
     * @tc.name   testUploadProgress0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_UPLOADPROGRESS_TEST_0700
     * @tc.desc   Verify testUploadProgress0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUploadProgress0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await tracker.setTotalChunks(3)
      await tracker.updateChunkProgress(0, 100)
      await tracker.updateChunkProgress(1, 50)
      await tracker.updateChunkProgress(2, 0)
      expect(await tracker.getOverallProgress()).assertEqual(50)
    })

    /**
     * @tc.name   testUploadProgress0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_UPLOADPROGRESS_TEST_0800
     * @tc.desc   Verify testUploadProgress0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUploadProgress0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await tracker.setTotalChunks(3)
      await tracker.markChunkFailed(1)
      expect(await tracker.getFailedChunks()).assertEqual(1)
    })

    /**
     * @tc.name   testUploadProgress0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_UPLOADPROGRESS_TEST_0900
     * @tc.desc   Verify testUploadProgress0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUploadProgress0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await tracker.setTotalChunks(3)
      await tracker.updateChunkProgress(0, 100)
      await tracker.markChunkFailed(1)
      expect(await tracker.getCompletedChunks()).assertEqual(1)
      expect(await tracker.getFailedChunks()).assertEqual(1)
    })

    /**
     * @tc.name   testUploadProgress1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_UPLOADPROGRESS_TEST_1000
     * @tc.desc   Verify testUploadProgress1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUploadProgress1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await tracker.setTotalChunks(2)
      await tracker.markChunkFailed(0)
      await tracker.updateChunkProgress(0, 30)
      expect(await tracker.getChunkProgress(0)).assertEqual(30)
    })

    /**
     * @tc.name   testUploadProgress1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_UPLOADPROGRESS_TEST_1100
     * @tc.desc   Verify testUploadProgress1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUploadProgress1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await tracker.setTotalChunks(3)
      await tracker.updateChunkProgress(0, 100)
      await tracker.updateChunkProgress(1, 100)
      await tracker.updateChunkProgress(2, 100)
      expect(await tracker.isCompleted()).assertTrue()
      await tracker.reset()
      expect(await tracker.getCompletedChunks()).assertEqual(0)
    })
  })
}
