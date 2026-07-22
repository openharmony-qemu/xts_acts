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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { collections } from '@kit.ArkTS'
import { ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class DataProcessProgress {
  public totalRows_: number = 0
  public processedRows_: number = 0
  public errorRows_: number = 0
  public percentage_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async setTotalRows(total: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.totalRows_ = total
      this.processedRows_ = 0
      this.errorRows_ = 0
      this.percentage_ = 0
    })
  }

  async addProcessedRows(count: number): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      this.processedRows_ += count
      if (this.processedRows_ > this.totalRows_) {
        this.processedRows_ = this.totalRows_
      }
      this.percentage_ = Math.floor((this.processedRows_ / this.totalRows_) * 100)
      return this.percentage_
    })
  }

  async addErrorRows(count: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.errorRows_ += count
    })
  }

  async getPercentage(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.percentage_)
  }

  async getProcessedRows(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.processedRows_)
  }

  async getErrorRows(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.errorRows_)
  }

  async getSuccessRows(): Promise<number> {
    return await this.lock_.lockAsync((): number => this.processedRows_ - this.errorRows_)
  }

  async isCompleted(): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => this.processedRows_ >= this.totalRows_)
  }

  async reset(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.totalRows_ = 0
      this.processedRows_ = 0
      this.errorRows_ = 0
      this.percentage_ = 0
    })
  }
}

@Concurrent
async function dataProcessTask(dp: DataProcessProgress, rows: number): Promise<void> {
  return await dp.lock_.lockAsync((): void => {
    dp.processedRows_ += rows
    if (dp.totalRows_ > 0) {
      dp.percentage_ = Math.floor((dp.processedRows_ / dp.totalRows_) * 100)
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

export default function BuiltinsDataProcessProgressTest(): void {
  describe('BuiltinsDataProcessProgressTest', () => {
    let dp: DataProcessProgress

    beforeEach(async (): Promise<void> => {
      dp = new DataProcessProgress(new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await dp.reset()
    })

    it('testDataProcessProgress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await dp.setTotalRows(100)
      expect(await dp.getPercentage()).assertEqual(0)
      expect(await dp.getProcessedRows()).assertEqual(0)
    })

    it('testDataProcessProgress0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await dp.setTotalRows(100)
      const p: number = await dp.addProcessedRows(50)
      expect(p).assertEqual(50)
      expect(await dp.getProcessedRows()).assertEqual(50)
    })

    it('testDataProcessProgress0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await dp.setTotalRows(100)
      await dp.addProcessedRows(100)
      expect(await dp.getPercentage()).assertEqual(100)
      expect(await dp.isCompleted()).assertTrue()
    })

    it('testDataProcessProgress0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await dp.setTotalRows(100)
      await dp.addProcessedRows(150)
      expect(await dp.getProcessedRows()).assertEqual(100)
      expect(await dp.getPercentage()).assertEqual(100)
    })

    it('testDataProcessProgress0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await dp.setTotalRows(100)
      await dp.addProcessedRows(80)
      await dp.addErrorRows(10)
      expect(await dp.getSuccessRows()).assertEqual(70)
      expect(await dp.getErrorRows()).assertEqual(10)
    })

    it('testDataProcessProgress0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await dp.setTotalRows(50)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(dataProcessTask, dp, 10))
      }
      await executeTasksGetObjects(tasks)
      expect(await dp.getProcessedRows()).assertEqual(50)
      expect(await dp.getPercentage()).assertEqual(100)
    })

    it('testDataProcessProgress0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await dp.setTotalRows(100)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(dataProcessTask, dp, 10))
      }
      await executeTasksGetObjects(tasks)
      expect(await dp.getProcessedRows()).assertEqual(100)
      expect(await dp.isCompleted()).assertTrue()
    })

    it('testDataProcessProgress0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await dp.setTotalRows(100)
      await dp.addProcessedRows(50)
      await dp.addErrorRows(5)
      await dp.reset()
      expect(await dp.getProcessedRows()).assertEqual(0)
      expect(await dp.getErrorRows()).assertEqual(0)
    })

    it('testDataProcessProgress0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await dp.setTotalRows(0)
      expect(await dp.getPercentage()).assertEqual(0)
    })

    it('testDataProcessProgress1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await dp.setTotalRows(100)
      await dp.addProcessedRows(30)
      await dp.addErrorRows(3)
      expect(await dp.getSuccessRows()).assertEqual(27)
      expect(await dp.getErrorRows()).assertEqual(3)
    })

    it('testDataProcessProgress1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      await dp.setTotalRows(100)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 100; i++) {
        tasks.push(new taskpool.Task(dataProcessTask, dp, 1))
      }
      await executeTasksGetObjects(tasks)
      expect(await dp.getProcessedRows()).assertEqual(100)
    })

    it('testDataProcessProgress1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await dp.setTotalRows(100)
      await dp.addProcessedRows(100)
      await dp.addErrorRows(20)
      expect(await dp.getSuccessRows()).assertEqual(80)
      expect(await dp.getErrorRows()).assertEqual(20)
    })
  })
}
