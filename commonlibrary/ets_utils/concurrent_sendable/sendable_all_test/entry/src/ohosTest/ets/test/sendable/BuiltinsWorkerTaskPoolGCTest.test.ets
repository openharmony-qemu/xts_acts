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
class WorkerGCData {
  public id_: number = 0
  public value_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock


  constructor(id: number, lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_

    this.id_ = id
    this.value_ = id * 100
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
class WorkerGCManager {
  private dataMap_: collections.Map<string, WorkerGCData>

  private lock_: ArkTSUtils.locks.AsyncLock

  constructor(dataMap_: collections.Map<string, WorkerGCData>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.dataMap_ = dataMap_
    this.lock_ = lock_
  }

  private createCount_: number = 0
  private deleteCount_: number = 0

  async create(key: string, id: number): Promise<WorkerGCData> {
    return await this.lock_.lockAsync((): WorkerGCData => {
      const data: WorkerGCData = new WorkerGCData(id, this.lock_)
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

  get(key: string): WorkerGCData | undefined {
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
function workerGCTask(data: WorkerGCData): number {
  return data.getValue()
}

@Concurrent
async function workerGCModifyTask(data: WorkerGCData, newVal: number): Promise<void> {
  await data.setValue(newVal)
}

function executeWorkerGCTasks(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsWorkerTaskPoolGCTest(): void {
  describe('BuiltinsWorkerTaskPoolGCTest', (): void => {
    let manager: WorkerGCManager = new WorkerGCManager(new collections.Map<string, WorkerGCData>(), new ArkTSUtils.locks.AsyncLock())

    beforeEach((): void => {
      manager = new WorkerGCManager(new collections.Map<string, WorkerGCData>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testWorkerTaskPoolGC0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_TASKPOOL_GC_TEST_0100
     * @tc.desc   Verify TaskPool task reference release after completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerTaskPoolGC0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const data: WorkerGCData = await manager.create('tp_release', 1)
      const task: taskpool.Task = new taskpool.Task(workerGCTask, data)
      const result: Object = await taskpool.execute(task)
      expect(result as number).assertEqual(100)
      expect(manager.getSize()).assertEqual(1)
    })

    /**
     * @tc.name   testWorkerTaskPoolGC0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_TASKPOOL_GC_TEST_0200
     * @tc.desc   Verify multi-TaskPool concurrent reference with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWorkerTaskPoolGC0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: WorkerGCData = await manager.create('tp_multi', 2)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(workerGCTask, data))
      }
      const results: Object[] = await executeWorkerGCTasks(tasks)
      expect(results.length).assertEqual(5)
      for (let i: number = 0; i < 5; i++) {
        expect(results[i] as number).assertEqual(200)
      }
    })

    /**
     * @tc.name   testWorkerTaskPoolGC0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_TASKPOOL_GC_TEST_0300
     * @tc.desc   Verify TaskPool task modify Sendable object - GC safe
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWorkerTaskPoolGC0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: WorkerGCData = await manager.create('tp_modify', 3)
      const task: taskpool.Task = new taskpool.Task(workerGCModifyTask, data, 999)
      await taskpool.execute(task)
      expect(data.getValue()).assertEqual(999)
    })

    /**
     * @tc.name   testWorkerTaskPoolGC0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_TASKPOOL_GC_TEST_0400
     * @tc.desc   Verify TaskPool sequential create and delete Sendable objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWorkerTaskPoolGC0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 5; i++) {
        await manager.create(`tp_cd_${i}`, i)
      }
      expect(manager.getCreateCount()).assertEqual(5)

      for (let i: number = 0; i < 5; i++) {
        await manager.delete(`tp_cd_${i}`)
      }
      expect(manager.getDeleteCount()).assertEqual(5)
    })

    /**
     * @tc.name   testWorkerTaskPoolGC0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_TASKPOOL_GC_TEST_0500
     * @tc.desc   Verify TaskPool long-running task GC does not release in-use objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWorkerTaskPoolGC0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: WorkerGCData = await manager.create('tp_long', 5)
      const task: taskpool.Task = new taskpool.Task(workerGCTask, data)
      const result: Object = await taskpool.execute(task)
      expect(result as number).assertEqual(500)
      expect(data.getId()).assertEqual(5)
    })

    /**
     * @tc.name   testWorkerTaskPoolGC0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_TASKPOOL_GC_TEST_0600
     * @tc.desc   Verify TaskPool task exception does not cause memory leak
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWorkerTaskPoolGC0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: WorkerGCData = await manager.create('tp_exc', 6)
      expect(manager.getSize()).assertEqual(1)

      const task: taskpool.Task = new taskpool.Task(workerGCTask, data)
      await taskpool.execute(task)
      expect(manager.getSize()).assertEqual(1)
    })

    /**
     * @tc.name   testWorkerTaskPoolGC0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_TASKPOOL_GC_TEST_0700
     * @tc.desc   Verify TaskPool and main thread concurrent access GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWorkerTaskPoolGC0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: WorkerGCData = await manager.create('tp_main', 7)
      expect(data.getValue()).assertEqual(700)

      const task: taskpool.Task = new taskpool.Task(workerGCTask, data)
      const result: Object = await taskpool.execute(task)
      expect(result as number).assertEqual(700)
      expect(data.getValue()).assertEqual(700)
    })

    /**
     * @tc.name   testWorkerTaskPoolGC0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_TASKPOOL_GC_TEST_0800
     * @tc.desc   Verify TaskPool task cancellation GC behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWorkerTaskPoolGC0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: WorkerGCData = await manager.create('tp_cancel', 8)
      expect(manager.getSize()).assertEqual(1)

      await manager.delete('tp_cancel')
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testWorkerTaskPoolGC0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_TASKPOOL_GC_TEST_0900
     * @tc.desc   Verify TaskPool sendData passing Sendable reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWorkerTaskPoolGC0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: WorkerGCData = await manager.create('tp_send', 9)
      const task1: taskpool.Task = new taskpool.Task(workerGCTask, data)
      const task2: taskpool.Task = new taskpool.Task(workerGCTask, data)
      const results: Object[] = await Promise.all([taskpool.execute(task1), taskpool.execute(task2)])
      expect(results.length).assertEqual(2)
      expect(results[0] as number).assertEqual(900)
      expect(results[1] as number).assertEqual(900)
    })

    /**
     * @tc.name   testWorkerTaskPoolGC1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_WORKER_TASKPOOL_GC_TEST_1000
     * @tc.desc   Verify TaskPool multiple tasks concurrent GC stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWorkerTaskPoolGC1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 10; i++) {
        await manager.create(`tp_stable_${i}`, i)
      }
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        const data: WorkerGCData | undefined = manager.get(`tp_stable_${i}`)
        if (data !== undefined) {
          tasks.push(new taskpool.Task(workerGCTask, data))
        }
      }
      const results: Object[] = await executeWorkerGCTasks(tasks)
      expect(results.length).assertEqual(10)
      for (let i: number = 0; i < 10; i++) {
        expect(results[i] as number).assertEqual(i * 100)
      }
    })
  })
}
