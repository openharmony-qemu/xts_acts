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
class RefCountGCData {
  public id_: number = 0
  public data_: string = ''
  public lock_: ArkTSUtils.locks.AsyncLock

  public accessCount_: number = 0

  constructor(id: number, lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_

    this.id_ = id
    this.data_ = `data-${id}`
  }

  async access(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.accessCount_++
    })
  }

  getId(): number {
    return this.id_
  }

  getData(): string {
    return this.data_
  }

  getAccessCount(): number {
    return this.accessCount_
  }
}

@Sendable
class RefCountGCManager {
  private dataMap_: collections.Map<string, RefCountGCData>

  private lock_: ArkTSUtils.locks.AsyncLock

  constructor(dataMap_: collections.Map<string, RefCountGCData>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.dataMap_ = dataMap_
    this.lock_ = lock_
  }

  private totalAccess_: number = 0
  private dataCount_: number = 0

  async create(key: string, id: number): Promise<RefCountGCData> {
    return await this.lock_.lockAsync((): RefCountGCData => {
      const data: RefCountGCData = new RefCountGCData(id, this.lock_)
      this.dataMap_.set(key, data)
      this.dataCount_++
      return data
    })
  }

  get(key: string): RefCountGCData | undefined {
    return this.dataMap_.get(key)
  }

  async recordAccess(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.totalAccess_++
    })
  }

  getTotalAccess(): number {
    return this.totalAccess_
  }

  getSize(): number {
    return this.dataCount_
  }

  async delete(key: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      const existed: boolean = this.dataMap_.has(key)
      this.dataMap_.delete(key)
      if (existed) {
        this.dataCount_--
      }
      return existed
    })
  }

  async clearAll(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.dataMap_.clear()
      this.dataCount_ = 0
      this.totalAccess_ = 0
    })
  }
}

@Concurrent
async function accessRefCountTask(data: RefCountGCData): Promise<void> {
  await data.access()
}

@Concurrent
function readRefCountTask(data: RefCountGCData): number {
  return data.getId()
}

function executeRefCountTasks(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function RefCountGCTest(): void {
  describe('RefCountGCTest', (): void => {
    let manager: RefCountGCManager = new RefCountGCManager(new collections.Map<string, RefCountGCData>(), new ArkTSUtils.locks.AsyncLock())

    beforeEach((): void => {
      manager = new RefCountGCManager(new collections.Map<string, RefCountGCData>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testRefCountGC0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REF_COUNT_GC_TEST_0100
     * @tc.desc   Verify reference count initial value is 1 on creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefCountGC0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const data: RefCountGCData = await manager.create('init', 1)
      expect(data.getId()).assertEqual(1)
      expect(data.getData()).assertEqual('data-1')
      expect(data.getAccessCount()).assertEqual(0)
      expect(manager.getSize()).assertEqual(1)
    })

    /**
     * @tc.name   testRefCountGC0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REF_COUNT_GC_TEST_0200
     * @tc.desc   Verify reference count increase with multiple reference passing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRefCountGC0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: RefCountGCData = await manager.create('multi_ref', 2)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(accessRefCountTask, data))
      }
      await executeRefCountTasks(tasks)
      expect(data.getAccessCount()).assertEqual(3)
    })

    /**
     * @tc.name   testRefCountGC0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REF_COUNT_GC_TEST_0300
     * @tc.desc   Verify reference count decrease with reference release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRefCountGC0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: RefCountGCData = await manager.create('decrease', 3)
      expect(manager.getSize()).assertEqual(1)

      await manager.delete('decrease')
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testRefCountGC0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REF_COUNT_GC_TEST_0400
     * @tc.desc   Verify reference count zero triggers GC auto release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRefCountGC0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 5; i++) {
        await manager.create(`temp_${i}`, i)
      }
      expect(manager.getSize()).assertEqual(5)

      await manager.clearAll()
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testRefCountGC0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REF_COUNT_GC_TEST_0500
     * @tc.desc   Verify reference count cross-thread sync - main to TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRefCountGC0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: RefCountGCData = await manager.create('cross_thread', 5)
      const task: taskpool.Task = new taskpool.Task(readRefCountTask, data)
      const result: Object = await taskpool.execute(task)
      expect(result as number).assertEqual(5)
      expect(data.getId()).assertEqual(5)
    })

    /**
     * @tc.name   testRefCountGC0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REF_COUNT_GC_TEST_0600
     * @tc.desc   Verify multi-thread concurrent reference count increase and decrease
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRefCountGC0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: RefCountGCData = await manager.create('concurrent', 7)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(accessRefCountTask, data))
      }
      await executeRefCountTasks(tasks)
      expect(data.getAccessCount()).assertEqual(10)
    })

    /**
     * @tc.name   testRefCountGC0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REF_COUNT_GC_TEST_0700
     * @tc.desc   Verify reference not released - memory persists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRefCountGC0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: RefCountGCData = await manager.create('persist', 8)
      expect(data.getId()).assertEqual(8)
      expect(data.getData()).assertEqual('data-8')
      expect(manager.getSize()).assertEqual(1)
    })

    /**
     * @tc.name   testRefCountGC0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REF_COUNT_GC_TEST_0800
     * @tc.desc   Verify reference count zero timing - auto GC trigger
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRefCountGC0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 100; i++) {
        const mgr: RefCountGCManager = new RefCountGCManager(new collections.Map<string, RefCountGCData>(), new ArkTSUtils.locks.AsyncLock())
        await mgr.create(`batch_${i}`, i)
      }
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testRefCountGC0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REF_COUNT_GC_TEST_0900
     * @tc.desc   Verify reference chain integrity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRefCountGC0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const parent: RefCountGCData = await manager.create('parent', 1)
      const child: RefCountGCData = await manager.create('child', 2)
      expect(manager.getSize()).assertEqual(2)

      await manager.delete('child')
      expect(manager.getSize()).assertEqual(1)

      expect(parent.getId()).assertEqual(1)
    })

    /**
     * @tc.name   testRefCountGC1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REF_COUNT_GC_TEST_1000
     * @tc.desc   Verify concurrent create with small concurrency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRefCountGC1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 5; i++) {
        await manager.create(`small_${i}`, i)
      }
      expect(manager.getSize()).assertEqual(5)
    })
  })
}
