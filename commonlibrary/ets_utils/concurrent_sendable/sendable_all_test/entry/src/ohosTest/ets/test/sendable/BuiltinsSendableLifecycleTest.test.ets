/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
class LifecycleData {
  public id_: number = 0
  public name_: string = ''
  public lock_: ArkTSUtils.locks.AsyncLock


  constructor(id: number, name: string, lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_

    this.id_ = id
    this.name_ = name
  }

  getId(): number {
    return this.id_
  }

  getName(): string {
    return this.name_
  }
}

@Sendable
class LifecycleManager {
  private dataMap_: collections.Map<string, LifecycleData>

  private lock_: ArkTSUtils.locks.AsyncLock

  constructor(dataMap_: collections.Map<string, LifecycleData>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.dataMap_ = dataMap_
    this.lock_ = lock_
  }

  private createCount_: number = 0
  private deleteCount_: number = 0

  async create(key: string, id: number): Promise<LifecycleData> {
    return await this.lock_.lockAsync((): LifecycleData => {
      const data: LifecycleData = new LifecycleData(id, key, this.lock_)
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

  get(key: string): LifecycleData | undefined {
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
function lifecycleTask(data: LifecycleData): number {
  return data.getId() * 2
}

@Concurrent
function consumeLifecycleTask(data: LifecycleData): string {
  return `consumed: ${data.getName()}`
}

function executeLifecycleTasks(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsSendableLifecycleTest(): void {
  describe('BuiltinsSendableLifecycleTest', (): void => {
    let manager: LifecycleManager = new LifecycleManager(new collections.Map<string, LifecycleData>(), new ArkTSUtils.locks.AsyncLock())

    beforeEach((): void => {
      manager = new LifecycleManager(new collections.Map<string, LifecycleData>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testSendableLifecycle0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_LIFECYCLE_TEST_0100
     * @tc.desc   Verify Sendable object creation on shared heap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLifecycle0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const data: LifecycleData = await manager.create('create_test', 1)
      expect(data.getId()).assertEqual(1)
      expect(data.getName()).assertEqual('create_test')
      expect(manager.getSize()).assertEqual(1)
    })

    /**
     * @tc.name   testSendableLifecycle0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_LIFECYCLE_TEST_0200
     * @tc.desc   Verify single-thread reference count reaching zero triggers GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableLifecycle0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const data: LifecycleData = await manager.create('ref_zero', 2)
      expect(manager.getSize()).assertEqual(1)

      await manager.delete('ref_zero')
      expect(manager.getSize()).assertEqual(0)
      expect(manager.getDeleteCount()).assertEqual(1)
    })

    /**
     * @tc.name   testSendableLifecycle0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_LIFECYCLE_TEST_0300
     * @tc.desc   Verify multi-thread reference with Promise.all waiting for completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableLifecycle0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: LifecycleData = await manager.create('multi_thread', 3)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(lifecycleTask, data))
      }
      const results: Object[] = await executeLifecycleTasks(tasks)
      expect(results.length).assertEqual(3)
      expect(results[0] as number).assertEqual(6)
      expect(results[1] as number).assertEqual(6)
      expect(results[2] as number).assertEqual(6)
    })

    /**
     * @tc.name   testSendableLifecycle0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_LIFECYCLE_TEST_0400
     * @tc.desc   Verify reference count zero triggers GC release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableLifecycle0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 5; i++) {
        await manager.create(`temp_${i}`, i)
      }
      expect(manager.getSize()).assertEqual(5)

      for (let i: number = 0; i < 5; i++) {
        await manager.delete(`temp_${i}`)
      }
      expect(manager.getSize()).assertEqual(0)
      expect(manager.getDeleteCount()).assertEqual(5)
    })

    /**
     * @tc.name   testSendableLifecycle0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_LIFECYCLE_TEST_0500
     * @tc.desc   Verify Sendable object state after forced GC with reference count > 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableLifecycle0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: LifecycleData = await manager.create('force_gc', 5)
      expect(data.getId()).assertEqual(5)
      expect(data.getName()).assertEqual('force_gc')
      expect(manager.getSize()).assertEqual(1)
    })

    /**
     * @tc.name   testSendableLifecycle0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_LIFECYCLE_TEST_0600
     * @tc.desc   Verify main thread + TaskPool reference - all released after GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableLifecycle0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: LifecycleData = await manager.create('main_tp', 6)
      const task: taskpool.Task = new taskpool.Task(consumeLifecycleTask, data)
      const result: Object = await taskpool.execute(task)
      expect(result as string).assertEqual('consumed: main_tp')
      expect(data.getId()).assertEqual(6)
    })

    /**
     * @tc.name   testSendableLifecycle0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_LIFECYCLE_TEST_0700
     * @tc.desc   Verify Sendable object create-destroy cycle memory stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableLifecycle0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let round: number = 0; round < 5; round++) {
        for (let i: number = 0; i < 5; i++) {
          await manager.create(`cycle_${round}_${i}`, round * 10 + i)
        }
        expect(manager.getSize()).assertEqual(5)

        for (let i: number = 0; i < 5; i++) {
          await manager.delete(`cycle_${round}_${i}`)
        }
        expect(manager.getSize()).assertEqual(0)
      }
      expect(manager.getCreateCount()).assertEqual(25)
      expect(manager.getDeleteCount()).assertEqual(25)
    })

    /**
     * @tc.name   testSendableLifecycle0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_LIFECYCLE_TEST_0800
     * @tc.desc   Verify Sendable object property preservation after GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableLifecycle0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: LifecycleData = await manager.create('preserve', 100)
      expect(data.getId()).assertEqual(100)
      expect(data.getName()).assertEqual('preserve')

      const retrieved: LifecycleData | undefined = manager.get('preserve')
      expect(retrieved !== undefined).assertTrue()
      expect(retrieved!.getId()).assertEqual(100)
      expect(retrieved!.getName()).assertEqual('preserve')
    })

    /**
     * @tc.name   testSendableLifecycle0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_LIFECYCLE_TEST_0900
     * @tc.desc   Verify nested Sendable object lifecycle management
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableLifecycle0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const parent: LifecycleData = await manager.create('parent', 1)
      const child: LifecycleData = await manager.create('child', 2)
      expect(manager.getSize()).assertEqual(2)

      await manager.delete('child')
      expect(manager.getSize()).assertEqual(1)

      const parentData: LifecycleData | undefined = manager.get('parent')
      expect(parentData !== undefined).assertTrue()
      expect(parentData!.getId()).assertEqual(1)
    })

    /**
     * @tc.name   testSendableLifecycle1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_LIFECYCLE_TEST_1000
     * @tc.desc   Verify Sendable object with collections container lifecycle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableLifecycle1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 10; i++) {
        await manager.create(`container_${i}`, i)
      }
      expect(manager.getSize()).assertEqual(10)

      await manager.clearAll()
      expect(manager.getCreateCount()).assertEqual(0)

      for (let i: number = 0; i < 5; i++) {
        await manager.create(`new_${i}`, i * 10)
      }
      expect(manager.getSize()).assertEqual(5)
    })
  })
}
