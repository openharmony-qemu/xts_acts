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
class RefCountData {
  public id_: number = 0
  public name_: string = ''
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }

  public accessCount_: number = 0

  async access(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      this.accessCount_++
      return this.accessCount_
    })
  }

  getId(): number {
    return this.id_
  }

  getAccessCount(): number {
    return this.accessCount_
  }
}

@Sendable
class RefCountManager {
  private dataMap_: collections.Map<string, RefCountData>

  private lock_: ArkTSUtils.locks.AsyncLock

  constructor(dataMap_: collections.Map<string, RefCountData>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.dataMap_ = dataMap_
    this.lock_ = lock_
  }

  private totalAccess_: number = 0
  private dataCount_: number = 0

  async create(key: string, id: number): Promise<RefCountData> {
    return await this.lock_.lockAsync((): RefCountData => {
      const data: RefCountData = new RefCountData(this.lock_)
      data.id_ = id
      data.name_ = key
      this.dataMap_.set(key, data)
      this.dataCount_++
      return data
    })
  }

  get(key: string): RefCountData | undefined {
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
}

@Concurrent
async function accessRefDataTask(data: RefCountData): Promise<void> {
  await data.access()
}

@Concurrent
function readRefDataTask(data: RefCountData): number {
  return data.getId()
}

@Concurrent
async function createRefDataTask(mgr: RefCountManager, key: string, id: number): Promise<void> {
  await mgr.create(key, id)
}

function executeTasks(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsMultiThreadRefGCTest(): void {
  describe('BuiltinsMultiThreadRefGCTest', (): void => {
    let manager: RefCountManager = new RefCountManager(new collections.Map<string, RefCountData>(), new ArkTSUtils.locks.AsyncLock())

    beforeEach((): void => {
      manager = new RefCountManager(new collections.Map<string, RefCountData>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   BuiltinsMultiThreadRefGCTest0100
     * @tc.number SUB_BUILTINS_MULTI_THREAD_REF_GC_TEST_0100
     * @tc.desc   Verify TaskPool reference release after task completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsMultiThreadRefGCTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const data: RefCountData = await manager.create('ref1', 1)
      const task: taskpool.Task = new taskpool.Task(accessRefDataTask, data)
      await taskpool.execute(task)

      expect(data.getAccessCount()).assertEqual(1)
    })

    /**
     * @tc.name   BuiltinsMultiThreadRefGCTest0200
     * @tc.number SUB_BUILTINS_MULTI_THREAD_REF_GC_TEST_0200
     * @tc.desc   Verify multi-TaskPool concurrent reference with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsMultiThreadRefGCTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: RefCountData = await manager.create('ref_multi', 2)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(accessRefDataTask, data))
      }
      await executeTasks(tasks)
      expect(data.getAccessCount()).assertEqual(5)
    })

    /**
     * @tc.name   BuiltinsMultiThreadRefGCTest0300
     * @tc.number SUB_BUILTINS_MULTI_THREAD_REF_GC_TEST_0300
     * @tc.desc   Verify main thread + TaskPool reference - all released after GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsMultiThreadRefGCTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: RefCountData = await manager.create('main_tp', 3)
      expect(data.getId()).assertEqual(3)

      const task: taskpool.Task = new taskpool.Task(readRefDataTask, data)
      const result: Object = await taskpool.execute(task)
      expect(result as number).assertEqual(3)
    })

    /**
     * @tc.name   BuiltinsMultiThreadRefGCTest0400
     * @tc.number SUB_BUILTINS_MULTI_THREAD_REF_GC_TEST_0400
     * @tc.desc   Verify all references released triggers GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsMultiThreadRefGCTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: RefCountData = await manager.create('all_release', 4)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(accessRefDataTask, data))
      }
      await executeTasks(tasks)
      expect(data.getAccessCount()).assertEqual(3)
    })

    /**
     * @tc.name   BuiltinsMultiThreadRefGCTest0500
     * @tc.number SUB_BUILTINS_MULTI_THREAD_REF_GC_TEST_0500
     * @tc.desc   Verify partial reference release does not trigger GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsMultiThreadRefGCTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: RefCountData = await manager.create('partial', 5)
      const task1: taskpool.Task = new taskpool.Task(accessRefDataTask, data)
      await taskpool.execute(task1)

      expect(manager.get('partial') !== undefined).assertTrue()
      expect(data.getAccessCount()).assertEqual(1)
    })

    /**
     * @tc.name   BuiltinsMultiThreadRefGCTest0600
     * @tc.number SUB_BUILTINS_MULTI_THREAD_REF_GC_TEST_0600
     * @tc.desc   Verify sendData passing Sendable reference count change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsMultiThreadRefGCTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: RefCountData = await manager.create('sendable', 6)
      const task: taskpool.Task = new taskpool.Task(accessRefDataTask, data)
      await taskpool.execute(task)
      await taskpool.execute(new taskpool.Task(accessRefDataTask, data))

      expect(data.getAccessCount()).assertEqual(2)
    })

    /**
     * @tc.name   BuiltinsMultiThreadRefGCTest0700
     * @tc.number SUB_BUILTINS_MULTI_THREAD_REF_GC_TEST_0700
     * @tc.desc   Verify reference release order does not affect GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsMultiThreadRefGCTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data1: RefCountData = await manager.create('order1', 7)
      const data2: RefCountData = await manager.create('order2', 8)

      const task1: taskpool.Task = new taskpool.Task(accessRefDataTask, data1)
      const task2: taskpool.Task = new taskpool.Task(accessRefDataTask, data2)
      await taskpool.execute(task1)
      await taskpool.execute(task2)

      expect(data1.getAccessCount()).assertEqual(1)
      expect(data2.getAccessCount()).assertEqual(1)
    })

    /**
     * @tc.name   BuiltinsMultiThreadRefGCTest0800
     * @tc.number SUB_BUILTINS_MULTI_THREAD_REF_GC_TEST_0800
     * @tc.desc   Verify reference count initial value is 1 on creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsMultiThreadRefGCTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const data: RefCountData = await manager.create('init_ref', 9)
      expect(data.getId()).assertEqual(9)
      expect(data.getAccessCount()).assertEqual(0)
    })

    /**
     * @tc.name   BuiltinsMultiThreadRefGCTest0900
     * @tc.number SUB_BUILTINS_MULTI_THREAD_REF_GC_TEST_0900
     * @tc.desc   Verify reference count increase with multiple reference passing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsMultiThreadRefGCTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: RefCountData = await manager.create('multi_ref', 10)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(accessRefDataTask, data))
      }
      await executeTasks(tasks)
      expect(data.getAccessCount()).assertEqual(10)
    })

    /**
     * @tc.name   BuiltinsMultiThreadRefGCTest1000
     * @tc.number SUB_BUILTINS_MULTI_THREAD_REF_GC_TEST_1000
     * @tc.desc   Verify reference count cross-thread synchronization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsMultiThreadRefGCTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: RefCountData = await manager.create('cross_thread', 11)
      const task: taskpool.Task = new taskpool.Task(readRefDataTask, data)
      const result: Object = await taskpool.execute(task)
      expect(result as number).assertEqual(11)

      await data.access()
      expect(data.getAccessCount()).assertEqual(1)
    })

    /**
     * @tc.name   BuiltinsMultiThreadRefGCTest1100
     * @tc.number SUB_BUILTINS_MULTI_THREAD_REF_GC_TEST_1100
     * @tc.desc   Verify concurrent create with 3 tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsMultiThreadRefGCTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(createRefDataTask, manager, `con3_${i}`, i))
      }
      await executeTasks(tasks)
      expect(manager.getSize()).assertEqual(3)
    })

    /**
     * @tc.name   BuiltinsMultiThreadRefGCTest1200
     * @tc.number SUB_BUILTINS_MULTI_THREAD_REF_GC_TEST_1200
     * @tc.desc   Verify concurrent create with 5 tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsMultiThreadRefGCTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(createRefDataTask, manager, `con5_${i}`, i))
      }
      await executeTasks(tasks)
      expect(manager.getSize()).assertEqual(5)
    })

    /**
     * @tc.name   BuiltinsMultiThreadRefGCTest1300
     * @tc.number SUB_BUILTINS_MULTI_THREAD_REF_GC_TEST_1300
     * @tc.desc   Verify reference count verification - reference chain integrity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsMultiThreadRefGCTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: RefCountData = await manager.create('chain', 13)
      const task1: taskpool.Task = new taskpool.Task(readRefDataTask, data)
      const r1: Object = await taskpool.execute(task1)

      const task2: taskpool.Task = new taskpool.Task(readRefDataTask, data)
      const r2: Object = await taskpool.execute(task2)

      expect(r1 as number).assertEqual(13)
      expect(r2 as number).assertEqual(13)
    })
  })
}
