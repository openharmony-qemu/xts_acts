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

export default function DataProcessProgressTest(): void {
  describe('DataProcessProgressTest', () => {
    let dp: DataProcessProgress

    beforeEach(async (): Promise<void> => {
      dp = new DataProcessProgress(new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await dp.reset()
    })

    /**
     * @tc.name   testDataProcessProgress0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATAPROCESSPROGRESS_TEST_0100
     * @tc.desc   Verify testDataProcessProgress0100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDataProcessProgress0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await dp.setTotalRows(100)
        expect(await dp.getPercentage()).assertEqual(0)
        expect(await dp.getProcessedRows()).assertEqual(0)
      } catch (error) {
        console.error("testDataProcessProgress0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataProcessProgress0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATAPROCESSPROGRESS_TEST_0200
     * @tc.desc   Verify testDataProcessProgress0200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDataProcessProgress0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await dp.setTotalRows(100)
        const p: number = await dp.addProcessedRows(50)
        expect(p).assertEqual(50)
        expect(await dp.getProcessedRows()).assertEqual(50)
      } catch (error) {
        console.error("testDataProcessProgress0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataProcessProgress0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATAPROCESSPROGRESS_TEST_0300
     * @tc.desc   Verify testDataProcessProgress0300 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDataProcessProgress0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await dp.setTotalRows(100)
        await dp.addProcessedRows(100)
        expect(await dp.getPercentage()).assertEqual(100)
        expect(await dp.isCompleted()).assertTrue()
      } catch (error) {
        console.error("testDataProcessProgress0300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataProcessProgress0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATAPROCESSPROGRESS_TEST_0400
     * @tc.desc   Verify testDataProcessProgress0400 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDataProcessProgress0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await dp.setTotalRows(100)
        await dp.addProcessedRows(150)
        expect(await dp.getProcessedRows()).assertEqual(100)
        expect(await dp.getPercentage()).assertEqual(100)
      } catch (error) {
        console.error("testDataProcessProgress0400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataProcessProgress0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATAPROCESSPROGRESS_TEST_0500
     * @tc.desc   Verify testDataProcessProgress0500 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDataProcessProgress0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await dp.setTotalRows(100)
        await dp.addProcessedRows(80)
        await dp.addErrorRows(10)
        expect(await dp.getSuccessRows()).assertEqual(70)
        expect(await dp.getErrorRows()).assertEqual(10)
      } catch (error) {
        console.error("testDataProcessProgress0500 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataProcessProgress0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATAPROCESSPROGRESS_TEST_0600
     * @tc.desc   Verify testDataProcessProgress0600 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDataProcessProgress0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await dp.setTotalRows(50)
        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 5; i++) {
          tasks.push(new taskpool.Task(dataProcessTask, dp, 10))
        }
        await executeTasksGetObjects(tasks)
        expect(await dp.getProcessedRows()).assertEqual(50)
        expect(await dp.getPercentage()).assertEqual(100)
      } catch (error) {
        console.error("testDataProcessProgress0600 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataProcessProgress0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATAPROCESSPROGRESS_TEST_0700
     * @tc.desc   Verify testDataProcessProgress0700 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDataProcessProgress0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await dp.setTotalRows(100)
        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 10; i++) {
          tasks.push(new taskpool.Task(dataProcessTask, dp, 10))
        }
        await executeTasksGetObjects(tasks)
        expect(await dp.getProcessedRows()).assertEqual(100)
        expect(await dp.isCompleted()).assertTrue()
      } catch (error) {
        console.error("testDataProcessProgress0700 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataProcessProgress0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATAPROCESSPROGRESS_TEST_0800
     * @tc.desc   Verify testDataProcessProgress0800 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDataProcessProgress0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await dp.setTotalRows(100)
        await dp.addProcessedRows(50)
        await dp.addErrorRows(5)
        await dp.reset()
        expect(await dp.getProcessedRows()).assertEqual(0)
        expect(await dp.getErrorRows()).assertEqual(0)
      } catch (error) {
        console.error("testDataProcessProgress0800 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataProcessProgress0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATAPROCESSPROGRESS_TEST_0900
     * @tc.desc   Verify testDataProcessProgress0900 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDataProcessProgress0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await dp.setTotalRows(0)
        expect(await dp.getPercentage()).assertEqual(0)
      } catch (error) {
        console.error("testDataProcessProgress0900 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataProcessProgress1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATAPROCESSPROGRESS_TEST_1000
     * @tc.desc   Verify testDataProcessProgress1000 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDataProcessProgress1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await dp.setTotalRows(100)
        await dp.addProcessedRows(30)
        await dp.addErrorRows(3)
        expect(await dp.getSuccessRows()).assertEqual(27)
        expect(await dp.getErrorRows()).assertEqual(3)
      } catch (error) {
        console.error("testDataProcessProgress1000 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataProcessProgress1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATAPROCESSPROGRESS_TEST_1100
     * @tc.desc   Verify testDataProcessProgress1100 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDataProcessProgress1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        await dp.setTotalRows(100)
        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 100; i++) {
          tasks.push(new taskpool.Task(dataProcessTask, dp, 1))
        }
        await executeTasksGetObjects(tasks)
        expect(await dp.getProcessedRows()).assertEqual(100)
      } catch (error) {
        console.error("testDataProcessProgress1100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testDataProcessProgress1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_DATAPROCESSPROGRESS_TEST_1200
     * @tc.desc   Verify testDataProcessProgress1200 behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDataProcessProgress1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        await dp.setTotalRows(100)
        await dp.addProcessedRows(100)
        await dp.addErrorRows(20)
        expect(await dp.getSuccessRows()).assertEqual(80)
        expect(await dp.getErrorRows()).assertEqual(20)
      } catch (error) {
        console.error("testDataProcessProgress1200 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
