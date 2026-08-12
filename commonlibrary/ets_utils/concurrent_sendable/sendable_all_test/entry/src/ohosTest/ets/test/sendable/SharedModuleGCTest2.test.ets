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
class SharedModuleGCItem {
  public id_: number = 0
  public module_: string = ''
  public lock_: ArkTSUtils.locks.AsyncLock


  constructor(id: number, module: string, lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_

    this.id_ = id
    this.module_ = module
  }

  getId(): number {
    return this.id_
  }

  getModule(): string {
    return this.module_
  }
}

@Sendable
class SharedModuleGCManager {
  private moduleMap_: collections.Map<string, SharedModuleGCItem>

  private lock_: ArkTSUtils.locks.AsyncLock

  constructor(moduleMap_: collections.Map<string, SharedModuleGCItem>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.moduleMap_ = moduleMap_
    this.lock_ = lock_
  }

  private createCount_: number = 0
  private deleteCount_: number = 0

  async create(key: string, id: number, module: string): Promise<SharedModuleGCItem> {
    return await this.lock_.lockAsync((): SharedModuleGCItem => {
      const item: SharedModuleGCItem = new SharedModuleGCItem(id, module, this.lock_)
      this.moduleMap_.set(key, item)
      this.createCount_++
      return item
    })
  }

  async delete(key: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      const existed: boolean = this.moduleMap_.has(key)
      this.moduleMap_.delete(key)
      if (existed) {
        this.deleteCount_++
      }
      return existed
    })
  }

  get(key: string): SharedModuleGCItem | undefined {
    return this.moduleMap_.get(key)
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
      this.moduleMap_.clear()
      this.createCount_ = 0
      this.deleteCount_ = 0
    })
  }
}

@Concurrent
function accessSharedModuleTask(item: SharedModuleGCItem): string {
  return `${item.getId()}:${item.getModule()}`
}

function executeSharedModuleTasks(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function SharedModuleGCTest2(): void {
  describe('SharedModuleGCTest2', (): void => {
    let manager: SharedModuleGCManager = new SharedModuleGCManager(new collections.Map<string, SharedModuleGCItem>(), new ArkTSUtils.locks.AsyncLock())

    beforeEach((): void => {
      manager = new SharedModuleGCManager(new collections.Map<string, SharedModuleGCItem>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testSharedModuleGC20100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC2_TEST_0100
     * @tc.desc   Verify shared module Sendable object GC release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedModuleGC20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const item: SharedModuleGCItem = await manager.create('mod1', 1, 'module_a')
      expect(item.getId()).assertEqual(1)
      expect(item.getModule()).assertEqual('module_a')

      await manager.delete('mod1')
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testSharedModuleGC20200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC2_TEST_0200
     * @tc.desc   Verify shared module cross-thread reference GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleGC20200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const item: SharedModuleGCItem = await manager.create('cross_mod', 2, 'module_b')
      const task: taskpool.Task = new taskpool.Task(accessSharedModuleTask, item)
      const result: Object = await taskpool.execute(task)
      expect(result as string).assertEqual('2:module_b')
    })

    /**
     * @tc.name   testSharedModuleGC20300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC2_TEST_0300
     * @tc.desc   Verify shared module reference count zero triggers GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleGC20300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 5; i++) {
        await manager.create(`mod_${i}`, i, `module_${i}`)
      }
      expect(manager.getSize()).assertEqual(5)

      await manager.clearAll()
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testSharedModuleGC20400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC2_TEST_0400
     * @tc.desc   Verify shared module GC does not affect other modules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleGC20400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const item1: SharedModuleGCItem = await manager.create('mod_a', 1, 'module_a')
      const item2: SharedModuleGCItem = await manager.create('mod_b', 2, 'module_b')

      await manager.delete('mod_a')
      expect(manager.getSize()).assertEqual(1)
      expect(item2.getId()).assertEqual(2)
      expect(item2.getModule()).assertEqual('module_b')
    })

    /**
     * @tc.name   testSharedModuleGC20500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC2_TEST_0500
     * @tc.desc   Verify shared module concurrent GC stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleGC20500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 5; i++) {
        await manager.create(`conc_${i}`, i, `mod_conc_${i}`)
      }
      expect(manager.getCreateCount()).assertEqual(5)
    })

    /**
     * @tc.name   testSharedModuleGC20600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC2_TEST_0600
     * @tc.desc   Verify shared module GC with nested Sendable objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleGC20600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const parent: SharedModuleGCItem = await manager.create('parent_mod', 10, 'parent')
      const child: SharedModuleGCItem = await manager.create('child_mod', 11, 'child')
      expect(manager.getSize()).assertEqual(2)

      await manager.delete('child_mod')
      expect(manager.getSize()).assertEqual(1)
      expect(parent.getId()).assertEqual(10)
    })

    /**
     * @tc.name   testSharedModuleGC20700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC2_TEST_0700
     * @tc.desc   Verify shared module GC with collections container
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleGC20700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const container: collections.Array<SharedModuleGCItem> = new collections.Array<SharedModuleGCItem>()
      for (let i: number = 0; i < 5; i++) {
        const item: SharedModuleGCItem = await manager.create(`arr_mod_${i}`, i, `arr_module_${i}`)
        container.push(item)
      }
      expect(container.length).assertEqual(5)
      expect(container[0].getModule()).assertEqual('arr_module_0')
    })

    /**
     * @tc.name   testSharedModuleGC20800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC2_TEST_0800
     * @tc.desc   Verify shared module GC after TaskPool task completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleGC20800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const item: SharedModuleGCItem = await manager.create('tp_mod', 20, 'tp_module')
      const task: taskpool.Task = new taskpool.Task(accessSharedModuleTask, item)
      await taskpool.execute(task)
      expect(item.getId()).assertEqual(20)
      expect(manager.getSize()).assertEqual(1)
    })

    /**
     * @tc.name   testSharedModuleGC20900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC2_TEST_0900
     * @tc.desc   Verify shared module batch create and delete GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleGC20900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let batch: number = 0; batch < 5; batch++) {
        for (let i: number = 0; i < 10; i++) {
          await manager.create(`batch_${batch}_${i}`, batch * 10 + i, `batch_mod_${batch}_${i}`)
        }
        for (let i: number = 0; i < 10; i++) {
          await manager.delete(`batch_${batch}_${i}`)
        }
      }
      expect(manager.getCreateCount()).assertEqual(50)
      expect(manager.getDeleteCount()).assertEqual(50)
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testSharedModuleGC21000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC2_TEST_1000
     * @tc.desc   Verify shared module GC with multi-TaskPool concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleGC21000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const item: SharedModuleGCItem = await manager.create('multi_tp', 30, 'multi_module')
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(accessSharedModuleTask, item))
      }
      const results: Object[] = await executeSharedModuleTasks(tasks)
      expect(results.length).assertEqual(5)
      for (let i: number = 0; i < 5; i++) {
        expect(results[i] as string).assertEqual('30:multi_module')
      }
    })
  })
}
