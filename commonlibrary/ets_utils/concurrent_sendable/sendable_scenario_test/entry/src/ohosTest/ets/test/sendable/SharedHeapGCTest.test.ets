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
import { GCFull } from '../GCFull'

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
     * @tc.desc   Verify manager clearAll resets shared object count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedHeapGC0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        for (let i: number = 0; i < 5; i++) {
          await manager.create(`obj_${i}`, i)
        }
        expect(manager.getSize()).assertEqual(5)

        await manager.clearAll()
        expect(manager.getSize()).assertEqual(0)
      } catch (error) {
        console.error("testSharedHeapGC0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSharedHeapGC0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_0200
     * @tc.desc   Verify shared object count changes after create and delete operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedHeapGC0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        expect(manager.getSize()).assertEqual(0)

        await manager.create('data1', 1)
        await manager.create('data2', 2)
        await manager.create('data3', 3)
        expect(manager.getSize()).assertEqual(3)

        await manager.delete('data1')
        await manager.delete('data2')
        await manager.delete('data3')
        expect(manager.getSize()).assertEqual(0)
      } catch (error) {
        console.error("testSharedHeapGC0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSharedHeapGC0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_0300
     * @tc.desc   Verify in-use shared objects stay accessible without GC trigger
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedHeapGC0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      try {
        const data: LargeGCData = await manager.create('active', 42)
        expect(data.getId()).assertEqual(42)

        const retrieved: LargeGCData | undefined = manager.get('active')
        expect(retrieved !== undefined).assertTrue()
        expect(retrieved!.getId()).assertEqual(42)
      } catch (error) {
        console.error("testSharedHeapGC0300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSharedHeapGC0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_0400
     * @tc.desc   Verify concurrent taskpool tasks mutate shared manager consistently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedHeapGC0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      try {
        const tasks: taskpool.Task[] = []
        for (let i: number = 0; i < 5; i++) {
          tasks.push(new taskpool.Task(createGCDataTask, manager, `gc_${i}`, i))
        }
        await executeTasks(tasks)
        expect(manager.getCreateCount()).assertEqual(5)
      } catch (error) {
        console.error("testSharedHeapGC0400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSharedHeapGC0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_0500
     * @tc.desc   Verify manager operations complete within bounded time without GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedHeapGC0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      try {
        const startTime: number = Date.now()
        for (let i: number = 0; i < 10; i++) {
          await manager.create(`fast_${i}`, i)
        }
        const elapsed: number = Date.now() - startTime
        expect(elapsed < 5000).assertTrue()
      } catch (error) {
        console.error("testSharedHeapGC0500 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSharedHeapGC0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_0600
     * @tc.desc   Verify object count consistency between create and delete counters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedHeapGC0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      try {
        for (let i: number = 0; i < 5; i++) {
          await manager.create(`cnt_${i}`, i)
        }
        expect(manager.getSize()).assertEqual(5)

        for (let i: number = 0; i < 5; i++) {
          await manager.delete(`cnt_${i}`)
        }
        expect(manager.getSize()).assertEqual(0)
        expect(manager.getDeleteCount()).assertEqual(5)
      } catch (error) {
        console.error("testSharedHeapGC0600 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSharedHeapGC0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_0700
     * @tc.desc   Verify repeated create-delete cycles keep manager state stable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedHeapGC0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      try {
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
      } catch (error) {
        console.error("testSharedHeapGC0700 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSharedHeapGC0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_0800
     * @tc.desc   Verify persisted shared object survives manager retrieval after operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedHeapGC0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      try {
        const data: LargeGCData = await manager.create('persist', 100)
        expect(data.getId()).assertEqual(100)

        const retrieved: LargeGCData | undefined = manager.get('persist')
        expect(retrieved !== undefined).assertTrue()
      } catch (error) {
        console.error("testSharedHeapGC0800 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSharedHeapGC0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_0900
     * @tc.desc   Verify manager capacity refills after clearAll reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedHeapGC0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      try {
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
      } catch (error) {
        console.error("testSharedHeapGC0900 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSharedHeapGC1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_1000
     * @tc.desc   Verify ArkTools.forceFullGC returns true and in-use Sendable objects stay valid after full shared heap GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSharedHeapGC1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const data: LargeGCData = await manager.create('gc_alive', 777)
        expect(manager.getSize()).assertEqual(1)
        const triggered: boolean = GCFull()
        expect(triggered).assertTrue()
        expect(data.getId()).assertEqual(777)
        const retrieved: LargeGCData | undefined = manager.get('gc_alive')
        expect(retrieved !== undefined).assertTrue()
        expect(retrieved!.getId()).assertEqual(777)
        await manager.clearAll()
        expect(manager.getSize()).assertEqual(0)
      } catch (error) {
        console.error("testSharedHeapGC1000 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSharedHeapGC1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_1100
     * @tc.desc   Verify forceFullGC stays stable after shared references are dropped and objects become collectable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSharedHeapGC1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        for (let i: number = 0; i < 5; i++) {
          await manager.create(`drop_${i}`, i)
        }
        expect(manager.getSize()).assertEqual(5)
        await manager.clearAll()
        expect(manager.getSize()).assertEqual(0)
        const first: boolean = GCFull()
        const second: boolean = GCFull()
        expect(first).assertTrue()
        expect(second).assertTrue()
        const fresh: LargeGCData = await manager.create('after_gc', 42)
        expect(fresh.getId()).assertEqual(42)
        expect(manager.getSize()).assertEqual(1)
      } catch (error) {
        console.error("testSharedHeapGC1100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSharedHeapGC1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_HEAP_GC_TEST_1200
     * @tc.desc   Verify repeated forceFullGC keeps cross-thread Sendable access consistent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSharedHeapGC1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const data: LargeGCData = await manager.create('cross_gc', 2026)
        const task: taskpool.Task = new taskpool.Task(accessGCDataTask, data)
        const before: Object = await taskpool.execute(task)
        expect(before as number).assertEqual(2026)
        for (let i: number = 0; i < 3; i++) {
          expect(GCFull()).assertTrue()
        }
        const task2: taskpool.Task = new taskpool.Task(accessGCDataTask, data)
        const after: Object = await taskpool.execute(task2)
        expect(after as number).assertEqual(2026)
      } catch (error) {
        console.error("testSharedHeapGC1200 failed");
        expect(false).assertFail();
      }
      done();
    })

  })
}
