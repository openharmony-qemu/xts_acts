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
class BatchData {
  public id_: number = 0
  public value_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()


  constructor(id: number, lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_

    this.id_ = id
    this.value_ = id * 10
  }

  getId(): number {
    return this.id_
  }

  getValue(): number {
    return this.value_
  }

  async setValue(v: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.value_ = v
    })
  }
}

@Sendable
class BatchManager {
  private dataMap_: collections.Map<string, BatchData> = new collections.Map<string, BatchData>()

  private lock_: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()

  constructor(dataMap_: collections.Map<string, BatchData>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.dataMap_ = dataMap_
    this.lock_ = lock_
  }

  private createCount_: number = 0
  private deleteCount_: number = 0

  async create(key: string, id: number): Promise<BatchData> {
    return await this.lock_.lockAsync((): BatchData => {
      const data: BatchData = new BatchData(id, this.lock_)
      this.dataMap_.set(key, data)
      this.createCount_++
      return data
    })
  }

  async delete(key: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      const existed: boolean = this.dataMap_.has(key)
      this.dataMap_.delete(key)
      if (existed) {
        this.deleteCount_++
      }
      return existed
    })
  }

  get(key: string): BatchData | undefined {
    return this.dataMap_.get(key)
  }

  getCreateCount(): number {
    return this.createCount_
  }

  getDeleteCount(): number {
    return this.deleteCount_
  }

  getSize(): number {
    return this.createCount_ - this.deleteCount_
  }

  async clearAll(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.dataMap_.clear()
      this.createCount_ = 0
      this.deleteCount_ = 0
    })
  }
}

@Concurrent
function batchAccessTask(data: BatchData): number {
  return data.getValue()
}

function executeBatchTasks(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsBatchCreateDestroyTest(): void {
  describe('BuiltinsBatchCreateDestroyTest', (): void => {
    let manager: BatchManager = new BatchManager(new collections.Map<string, BatchData>(), new ArkTSUtils.locks.AsyncLock())

    beforeEach((): void => {
      manager = new BatchManager(new collections.Map<string, BatchData>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testBatchCreateDestroy0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_BATCH_CREATE_DESTROY_TEST_0100
     * @tc.desc   Verify batch create 100 Sendable objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBatchCreateDestroy0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      for (let i: number = 0; i < 100; i++) {
        await manager.create(`batch_${i}`, i)
      }
      expect(manager.getSize()).assertEqual(100)
      expect(manager.getCreateCount()).assertEqual(100)
    })

    /**
     * @tc.name   testBatchCreateDestroy0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_BATCH_CREATE_DESTROY_TEST_0200
     * @tc.desc   Verify batch destroy 100 Sendable objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBatchCreateDestroy0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      for (let i: number = 0; i < 100; i++) {
        await manager.create(`destroy_${i}`, i)
      }
      for (let i: number = 0; i < 100; i++) {
        await manager.delete(`destroy_${i}`)
      }
      expect(manager.getSize()).assertEqual(0)
      expect(manager.getDeleteCount()).assertEqual(100)
    })

    /**
     * @tc.name   testBatchCreateDestroy0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_BATCH_CREATE_DESTROY_TEST_0300
     * @tc.desc   Verify batch create-destroy cycle memory stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchCreateDestroy0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let cycle: number = 0; cycle < 5; cycle++) {
        for (let i: number = 0; i < 50; i++) {
          await manager.create(`cycle_${cycle}_${i}`, cycle * 50 + i)
        }
        for (let i: number = 0; i < 50; i++) {
          await manager.delete(`cycle_${cycle}_${i}`)
        }
      }
      expect(manager.getCreateCount()).assertEqual(250)
      expect(manager.getDeleteCount()).assertEqual(250)
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testBatchCreateDestroy0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_BATCH_CREATE_DESTROY_TEST_0400
     * @tc.desc   Verify concurrent batch access with TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchCreateDestroy0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: BatchData = await manager.create('conc_access', 42)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 20; i++) {
        tasks.push(new taskpool.Task(batchAccessTask, data))
      }
      const results: Object[] = await executeBatchTasks(tasks)
      expect(results.length).assertEqual(20)
      for (let i: number = 0; i < 20; i++) {
        expect(results[i] as number).assertEqual(420)
      }
    })

    /**
     * @tc.name   testBatchCreateDestroy0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_BATCH_CREATE_DESTROY_TEST_0500
     * @tc.desc   Verify batch create then sequential delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchCreateDestroy0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 20; i++) {
        await manager.create(`seq_del_${i}`, i)
      }
      expect(manager.getSize()).assertEqual(20)

      for (let i: number = 0; i < 20; i++) {
        await manager.delete(`seq_del_${i}`)
      }
      expect(manager.getDeleteCount()).assertEqual(20)
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testBatchCreateDestroy0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_BATCH_CREATE_DESTROY_TEST_0600
     * @tc.desc   Verify batch create with large data objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchCreateDestroy0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 50; i++) {
        const data: BatchData = await manager.create(`large_${i}`, i * 1000)
        expect(data.getValue()).assertEqual(i * 10000)
      }
      expect(manager.getSize()).assertEqual(50)
    })

    /**
     * @tc.name   testBatchCreateDestroy0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_BATCH_CREATE_DESTROY_TEST_0700
     * @tc.desc   Verify batch create-destroy with interleaved access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchCreateDestroy0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 10; i++) {
        await manager.create(`inter_${i}`, i)
      }
      const data5: BatchData | undefined = manager.get('inter_5')
      expect(data5 !== undefined).assertTrue()
      expect(data5!.getValue()).assertEqual(50)

      for (let i: number = 0; i < 5; i++) {
        await manager.delete(`inter_${i}`)
      }
      expect(manager.getSize()).assertEqual(5)
    })

    /**
     * @tc.name   testBatchCreateDestroy0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_BATCH_CREATE_DESTROY_TEST_0800
     * @tc.desc   Verify batch create with collections container
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchCreateDestroy0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const container: collections.Array<BatchData> = new collections.Array<BatchData>()
      for (let i: number = 0; i < 30; i++) {
        const data: BatchData = await manager.create(`arr_batch_${i}`, i)
        container.push(data)
      }
      expect(container.length).assertEqual(30)
      expect(manager.getSize()).assertEqual(30)

      while (container.length > 0) {
        container.pop()
      }
      for (let i: number = 0; i < 30; i++) {
        await manager.delete(`arr_batch_${i}`)
      }
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testBatchCreateDestroy0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_BATCH_CREATE_DESTROY_TEST_0900
     * @tc.desc   Verify batch create-destroy pressure test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchCreateDestroy0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const startTime: number = Date.now()
      for (let i: number = 0; i < 200; i++) {
        await manager.create(`pressure_${i}`, i)
      }
      for (let i: number = 0; i < 200; i++) {
        await manager.delete(`pressure_${i}`)
      }
      const elapsed: number = Date.now() - startTime
      expect(manager.getSize()).assertEqual(0)
      expect(elapsed < 30000).assertTrue()
    })

    /**
     * @tc.name   testBatchCreateDestroy1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_BATCH_CREATE_DESTROY_TEST_1000
     * @tc.desc   Verify batch create-destroy with concurrent TaskPool access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBatchCreateDestroy1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 10; i++) {
        await manager.create(`mixed_${i}`, i)
      }
      const data: BatchData | undefined = manager.get('mixed_5')
      expect(data !== undefined).assertTrue()

      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(batchAccessTask, data!))
      }
      const results: Object[] = await executeBatchTasks(tasks)
      expect(results.length).assertEqual(5)

      await manager.delete('mixed_0')
      await manager.create('mixed_10', 10)
      expect(manager.getSize()).assertEqual(10)
    })
  })
}
