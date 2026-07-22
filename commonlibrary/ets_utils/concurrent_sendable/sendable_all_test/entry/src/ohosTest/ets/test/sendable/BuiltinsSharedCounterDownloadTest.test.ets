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
class DownloadProgress {
  public totalChunks_: number = 0
  public completedChunks_: number = 0
  public currentProgress_: collections.Array<number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(currentProgress_: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.currentProgress_ = currentProgress_
    this.lock_ = lock_
  }


  setTotalChunks(total: number): void {
    this.totalChunks_ = total
    for (let i = 0; i < total; i++) {
      this.currentProgress_.push(0)
    }
  }

  async updateChunkProgress(chunkIndex: number, progress: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      if (chunkIndex >= 0 && chunkIndex < this.totalChunks_) {
        this.currentProgress_[chunkIndex] = progress
        if (progress >= 100) {
          this.completedChunks_++
        }
      }
    })
  }

  getChunkProgress(chunkIndex: number): number {
    if (chunkIndex >= 0 && chunkIndex < this.totalChunks_) {
      return this.currentProgress_[chunkIndex]
    }
    return 0
  }

  async getTotalProgress(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      if (this.totalChunks_ === 0) {
        return 0
      }
      let sum: number = 0
      for (let i = 0; i < this.currentProgress_.length; i++) {
        sum += this.currentProgress_[i]
      }
      return Math.floor(sum / this.totalChunks_)
    })
  }

  async getCompletedChunks(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.completedChunks_)
  }

  async isCompleted(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.completedChunks_ >= this.totalChunks_)
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.totalChunks_ = 0
      this.completedChunks_ = 0
      while (this.currentProgress_.length > 0) { this.currentProgress_.pop() }
    })
  }
}

@Concurrent
function downloadChunk(chunkIndex: number): number {
  return chunkIndex * 100 + 100
}

@Concurrent
function downloadChunkFailed(chunkIndex: number): number {
  return 30
}

export default function BuiltinsSharedCounterDownloadTest(): void {
  describe('BuiltinsSharedCounterDownloadTest', (): void => {
    let progress: DownloadProgress

    beforeEach((): void => {
      progress = new DownloadProgress(new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
    })
    it('testSharedCounterDownload0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      progress.setTotalChunks(1)
      expect(progress.getChunkProgress(0)).assertEqual(0)
      expect(await progress.getTotalProgress()).assertEqual(0)
    })

    it('testSharedCounterDownload0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      progress.setTotalChunks(1)
      await progress.updateChunkProgress(0, 50)
      expect(progress.getChunkProgress(0)).assertEqual(50)
      expect(await progress.getTotalProgress()).assertEqual(50)
    })

    it('testSharedCounterDownload0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      progress.setTotalChunks(1)
      await progress.updateChunkProgress(0, 100)
      expect(progress.getChunkProgress(0)).assertEqual(100)
      expect(await progress.getCompletedChunks()).assertEqual(1)
      expect(await progress.isCompleted()).assertTrue()
    })

    it('testSharedCounterDownload0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      progress.setTotalChunks(5)
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(downloadChunk, i))
      }
      const promises: Promise<Object>[] = []
      for (let i = 0; i < tasks.length; i++) {
        promises.push(taskpool.execute(tasks[i]))
      }
      const results: Object[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        await progress.updateChunkProgress(i, results[i] as number)
      }
      expect(await progress.getCompletedChunks()).assertLargerOrEqual(1)
      expect(await progress.getTotalProgress()).assertLargerOrEqual(1)
    })

    it('testSharedCounterDownload0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      progress.setTotalChunks(10)
      for (let i = 0; i < 10; i++) {
        await progress.updateChunkProgress(i, 100)
      }
      expect(await progress.getCompletedChunks()).assertEqual(10)
      expect(await progress.isCompleted()).assertTrue()
    })

    it('testSharedCounterDownload0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      progress.setTotalChunks(3)
      const task0 = new taskpool.Task(downloadChunk, 0)
      const task1 = new taskpool.Task(downloadChunkFailed, 1)
      const task2 = new taskpool.Task(downloadChunk, 2)
      const results: Object[] = await Promise.all([
        taskpool.execute(task0),
        taskpool.execute(task1).catch((): Object => 30),
        taskpool.execute(task2)
      ])
      await progress.updateChunkProgress(0, results[0] as number)
      await progress.updateChunkProgress(1, results[1] as number)
      await progress.updateChunkProgress(2, results[2] as number)
      expect(progress.getChunkProgress(0)).assertLargerOrEqual(0)
      expect(progress.getChunkProgress(2)).assertLargerOrEqual(0)
      expect(await progress.getCompletedChunks()).assertLargerOrEqual(0)
    })

    it('testSharedCounterDownload0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      progress.setTotalChunks(3)
      const task = new taskpool.Task(downloadChunk, 0)
      const result: Object = await taskpool.execute(task)
      await progress.updateChunkProgress(0, result as number)
      expect(progress.getChunkProgress(0)).assertLargerOrEqual(0)
    })

    it('testSharedCounterDownload0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      progress.setTotalChunks(2)
      await progress.updateChunkProgress(0, 100)
      await progress.updateChunkProgress(1, 50)
      expect(await progress.getTotalProgress()).assertEqual(75)
      await progress.reset()
      expect(await progress.getTotalProgress()).assertEqual(0)
      expect(await progress.getCompletedChunks()).assertEqual(0)
    })
  })
}
