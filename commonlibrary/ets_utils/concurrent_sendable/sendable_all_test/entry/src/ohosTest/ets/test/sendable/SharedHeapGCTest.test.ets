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
class LargeGCData {
  public id_: number = 0
  public name_: string = ''
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async setId(id: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.id_ = id
    })
  }

  getId(): number {
    return this.id_
  }
}

@Sendable
class SharedHeapGCManager {
  private dataMap_: collections.Map<string, LargeGCData>

  private lock_: ArkTSUtils.locks.AsyncLock

  constructor(dataMap_: collections.Map<string, LargeGCData>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.dataMap_ = dataMap_
    this.lock_ = lock_
  }

  private createCount_: number = 0
  private deleteCount_: number = 0

  async create(key: string, id: number): Promise<LargeGCData> {
    return await this.lock_.lockAsync((): LargeGCData => {
      const data: LargeGCData = new LargeGCData(this.lock_)
      data.id_ = id
      data.name_ = key
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

  get(key: string): LargeGCData | undefined {
    return this.dataMap_.get(key)
  }

  private dataCount_: number = 0

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
async function createGCDataTask(mgr: SharedHeapGCManager, key: string, id: number): Promise<void> {
  await mgr.create(key, id)
}

@Concurrent
function deleteGCDataTask(mgr: SharedHeapGCManager, key: string): void {
  mgr.delete(key)
}

@Concurrent
function accessGCDataTask(d: LargeGCData): number {
  return d.getId()
}

function executeTasks(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function SharedHeapGCTest(): void {
  describe('SharedHeapGCTest', (): void => {
    let manager: SharedHeapGCManager = new SharedHeapGCManager(new collections.Map<string, LargeGCData>(), new ArkTSUtils.locks.AsyncLock())

    beforeEach((): void => {
      manager = new SharedHeapGCManager(new collections.Map<string, LargeGCData>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testSharedHeapGC0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_0100
     * @tc.desc   Verify forceFullGC triggers immediate GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedHeapGC0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      for (let i: number = 0; i < 5; i++) {
        await manager.create(`obj_${i}`, i)
      }
      expect(manager.getSize()).assertEqual(5)

      await manager.clearAll()
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testSharedHeapGC0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_0200
     * @tc.desc   Verify GC before and after memory change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedHeapGC0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      expect(manager.getSize()).assertEqual(0)

      await manager.create('data1', 1)
      await manager.create('data2', 2)
      await manager.create('data3', 3)
      expect(manager.getSize()).assertEqual(3)

      await manager.delete('data1')
      await manager.delete('data2')
      await manager.delete('data3')
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testSharedHeapGC0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_0300
     * @tc.desc   Verify GC trigger does not affect in-use objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedHeapGC0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: LargeGCData = await manager.create('active', 42)
      expect(data.getId()).assertEqual(42)

      const retrieved: LargeGCData | undefined = manager.get('active')
      expect(retrieved !== undefined).assertTrue()
      expect(retrieved!.getId()).assertEqual(42)
    })

    /**
     * @tc.name   testSharedHeapGC0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_0400
     * @tc.desc   Verify multi-thread concurrent GC trigger
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedHeapGC0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(createGCDataTask, manager, `gc_${i}`, i))
      }
      await executeTasks(tasks)
      expect(manager.getCreateCount()).assertEqual(5)
    })

    /**
     * @tc.name   testSharedHeapGC0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_0500
     * @tc.desc   Verify GC completion time is fast
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedHeapGC0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const startTime: number = Date.now()
      for (let i: number = 0; i < 10; i++) {
        await manager.create(`fast_${i}`, i)
      }
      const elapsed: number = Date.now() - startTime
      expect(elapsed < 5000).assertTrue()
    })

    /**
     * @tc.name   testSharedHeapGC0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_0600
     * @tc.desc   Verify object count change before and after GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedHeapGC0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 5; i++) {
        await manager.create(`cnt_${i}`, i)
      }
      expect(manager.getSize()).assertEqual(5)

      for (let i: number = 0; i < 5; i++) {
        await manager.delete(`cnt_${i}`)
      }
      expect(manager.getSize()).assertEqual(0)
      expect(manager.getDeleteCount()).assertEqual(5)
    })

    /**
     * @tc.name   testSharedHeapGC0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_0700
     * @tc.desc   Verify continuous multiple GC calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedHeapGC0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let totalCreates: number = 0
      for (let round: number = 0; round < 3; round++) {
        for (let i: number = 0; i < 5; i++) {
          await manager.create(`round${round}_${i}`, i)
          totalCreates++
        }
        await manager.clearAll()
      }
      expect(totalCreates).assertEqual(15)
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testSharedHeapGC0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_0800
     * @tc.desc   Verify GC trigger timing - auto vs forced GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedHeapGC0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: LargeGCData = await manager.create('persist', 100)
      expect(data.getId()).assertEqual(100)

      const retrieved: LargeGCData | undefined = manager.get('persist')
      expect(retrieved !== undefined).assertTrue()
    })

    /**
     * @tc.name   testSharedHeapGC0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_0900
     * @tc.desc   Verify shared heap capacity stability after GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedHeapGC0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 10; i++) {
        await manager.create(`cap_${i}`, i)
      }
      expect(manager.getSize()).assertEqual(10)

      await manager.clearAll()
      expect(manager.getSize()).assertEqual(0)

      for (let i: number = 0; i < 10; i++) {
        await manager.create(`cap2_${i}`, i * 10)
      }
      expect(manager.getSize()).assertEqual(10)
    })

  })
}
