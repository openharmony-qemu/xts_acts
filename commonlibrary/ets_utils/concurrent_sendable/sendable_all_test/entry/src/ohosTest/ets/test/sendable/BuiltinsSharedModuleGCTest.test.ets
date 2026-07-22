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
class SharedGCData {
  public value: number = 0
  public label: string = ''
}

@Sendable
class SharedGCManager {
  private dataMap_: collections.Map<string, SharedGCData>

  private lock_: ArkTSUtils.locks.AsyncLock

  constructor(dataMap_: collections.Map<string, SharedGCData>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.dataMap_ = dataMap_
    this.lock_ = lock_
  }

  private createCount_: number = 0
  private deleteCount_: number = 0

  async create(key: string, value: number): Promise<SharedGCData> {
    return await this.lock_.lockAsync((): SharedGCData => {
      const data: SharedGCData = new SharedGCData()
      data.value = value
      data.label = key
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

  get(key: string): SharedGCData | undefined {
    return this.dataMap_.get(key)
  }

  getCreateCount(): number {
    return this.createCount_
  }

  getDeleteCount(): number {
    return this.deleteCount_
  }

  getSize(): number {
    let count: number = 0
    this.dataMap_.forEach((_v: SharedGCData, _k: string): void => {
      count++
    })
    return count
  }

  async clear(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.dataMap_.clear()
      this.createCount_ = 0
      this.deleteCount_ = 0
    })
  }
}

@Concurrent
async function createGCDataTask(manager: SharedGCManager, key: string, value: number): Promise<void> {
  await manager.create(key, value)
}

@Concurrent
async function deleteGCDataTask(manager: SharedGCManager, key: string): Promise<void> {
  await manager.delete(key)
}

@Concurrent
function accessGCDataTask(d: SharedGCData): number {
  return d.value
}

export default function BuiltinsSharedModuleGCTest(): void {
  describe('BuiltinsSharedModuleGCTest', (): void => {
    const gcManager: SharedGCManager = new SharedGCManager(new collections.Map<string, SharedGCData>(), new ArkTSUtils.locks.AsyncLock())

    beforeEach(async (): Promise<void> => {
      await gcManager.clear()
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testSharedModuleGC0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC_TEST_0100
     * @tc.desc   Verify Sendable object creation and reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedModuleGC0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const data: SharedGCData = await gcManager.create('test1', 42)

      expect(data.value).assertEqual(42)
      expect(data.label).assertEqual('test1')
      expect(gcManager.getCreateCount()).assertEqual(1)
    })

    /**
     * @tc.name   testSharedModuleGC0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC_TEST_0200
     * @tc.desc   Verify Sendable object deletion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedModuleGC0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await gcManager.create('test2', 100)

      const result: boolean = await gcManager.delete('test2')
      expect(result).assertTrue()
      expect(gcManager.get('test2') === undefined).assertTrue()
      expect(gcManager.getDeleteCount()).assertEqual(1)
    })

    /**
     * @tc.name   testSharedModuleGC0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC_TEST_0300
     * @tc.desc   Verify deletion of non-existent object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSharedModuleGC0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const result: boolean = await gcManager.delete('nonexistent')
      expect(result).assertFalse()
    })

    /**
     * @tc.name   testSharedModuleGC0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC_TEST_0400
     * @tc.desc   Verify concurrent object creation with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleGC0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const keys: string[] = ['obj1', 'obj2', 'obj3']
      const tasks: taskpool.Task[] = keys.map((key: string, i: number): taskpool.Task =>
        new taskpool.Task(createGCDataTask, gcManager, key, i * 10)
      )
      const promises: Promise<Object>[] = tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t))
      await Promise.all(promises)

      expect(gcManager.getCreateCount()).assertEqual(3)
      expect(gcManager.getSize()).assertEqual(3)
    })

    /**
     * @tc.name   testSharedModuleGC0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC_TEST_0500
     * @tc.desc   Verify concurrent object deletion with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleGC0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await gcManager.create('del1', 1)
      await gcManager.create('del2', 2)
      await gcManager.create('del3', 3)

      const keys: string[] = ['del1', 'del2', 'del3']
      const tasks: taskpool.Task[] = keys.map((key: string): taskpool.Task =>
        new taskpool.Task(deleteGCDataTask, gcManager, key)
      )
      const promises: Promise<Object>[] = tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t))
      await Promise.all(promises)

      expect(gcManager.getDeleteCount()).assertEqual(3)
      expect(gcManager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testSharedModuleGC0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC_TEST_0600
     * @tc.desc   Verify object lifecycle: create, access, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedModuleGC0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const data: SharedGCData = await gcManager.create('lifecycle', 99)
      expect(data.value).assertEqual(99)

      const retrieved: SharedGCData | undefined = gcManager.get('lifecycle')
      expect(retrieved !== undefined).assertTrue()
      expect(retrieved!.value).assertEqual(99)

      await gcManager.delete('lifecycle')
      expect(gcManager.get('lifecycle') === undefined).assertTrue()
    })

    /**
     * @tc.name   testSharedModuleGC0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC_TEST_0700
     * @tc.desc   Verify size tracking after create and delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedModuleGC0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await gcManager.create('a', 1)
      await gcManager.create('b', 2)
      expect(gcManager.getSize()).assertEqual(2)

      await gcManager.delete('a')
      expect(gcManager.getSize()).assertEqual(1)

      await gcManager.delete('b')
      expect(gcManager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testSharedModuleGC0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC_TEST_0800
     * @tc.desc   Verify clear removes all objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedModuleGC0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await gcManager.create('x', 1)
      await gcManager.create('y', 2)
      await gcManager.create('z', 3)

      await gcManager.clear()

      expect(gcManager.getSize()).assertEqual(0)
      expect(gcManager.getCreateCount()).assertEqual(0)
      expect(gcManager.getDeleteCount()).assertEqual(0)
    })

    /**
     * @tc.name   testSharedModuleGC0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC_TEST_0900
     * @tc.desc   Verify small concurrency 5 concurrent creates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleGC0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(createGCDataTask, gcManager, `obj_${i}`, i))
      }
      const promises: Promise<Object>[] = tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t))
      await Promise.all(promises)

      expect(gcManager.getCreateCount()).assertEqual(5)
      expect(gcManager.getSize()).assertEqual(5)
    })

    /**
     * @tc.name   testSharedModuleGC1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC_TEST_1000
     * @tc.desc   Verify small concurrency 10 concurrent creates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleGC1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(createGCDataTask, gcManager, `obj_${i}`, i))
      }
      const promises: Promise<Object>[] = tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t))
      await Promise.all(promises)

      expect(gcManager.getCreateCount()).assertEqual(10)
      expect(gcManager.getSize()).assertEqual(10)
    })

    /**
     * @tc.name   testSharedModuleGC1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC_TEST_1100
     * @tc.desc   Verify object reference remains valid after concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleGC1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: SharedGCData = await gcManager.create('ref_test', 42)

      const tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(accessGCDataTask, data))
      }
      const promises: Promise<Object>[] = tasks.map((t: taskpool.Task): Promise<Object> => taskpool.execute(t))
      const results: Object[] = await Promise.all(promises)
      const values: number[] = results.map((r: Object): number => r as number)

      let allEqual: boolean = true
      for (let i = 0; i < values.length; i++) {
        if (values[i] !== 42) {
          allEqual = false
        }
      }
      expect(allEqual).assertTrue()
    })

    /**
     * @tc.name   testSharedModuleGC1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_GC_TEST_1200
     * @tc.desc   Verify create and delete count consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedModuleGC1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      await gcManager.create('c1', 1)
      await gcManager.create('c2', 2)
      await gcManager.delete('c1')

      expect(gcManager.getCreateCount()).assertEqual(2)
      expect(gcManager.getDeleteCount()).assertEqual(1)
      expect(gcManager.getSize()).assertEqual(1)
    })
  })
}
