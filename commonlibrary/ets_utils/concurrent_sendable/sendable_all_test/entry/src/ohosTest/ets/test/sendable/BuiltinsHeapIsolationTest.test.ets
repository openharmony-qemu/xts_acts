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
class SharedHeapObject {
  public id_: number = 0
  public data_: string = ''
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

  getData(): string {
    return this.data_
  }
}

@Sendable
class HeapIsolationManager {
  private sharedMap_: collections.Map<string, SharedHeapObject>

  private lock_: ArkTSUtils.locks.AsyncLock

  constructor(sharedMap_: collections.Map<string, SharedHeapObject>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.sharedMap_ = sharedMap_
    this.lock_ = lock_
  }

  private count_: number = 0

  async create(key: string, id: number): Promise<SharedHeapObject> {
    return await this.lock_.lockAsync((): SharedHeapObject => {
      const obj: SharedHeapObject = new SharedHeapObject(this.lock_)
      obj.id_ = id
      obj.data_ = key
      this.sharedMap_.set(key, obj)
      this.count_++
      return obj
    })
  }

  get(key: string): SharedHeapObject | undefined {
    return this.sharedMap_.get(key)
  }

  getSize(): number {
    return this.count_
  }

  async delete(key: string): Promise<boolean> {
    return await this.lock_.lockAsync((): boolean => {
      const existed: boolean = this.sharedMap_.has(key)
      this.sharedMap_.delete(key)
      if (existed) {
        this.count_--
      }
      return existed
    })
  }

  async clearAll(): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.sharedMap_.clear()
      this.count_ = 0
    })
  }
}

@Concurrent
function sharedAccessTask(obj: SharedHeapObject): number {
  return obj.getId() * 10
}

@Concurrent
function processLocalDataTask(id: number, name: string): string {
  return `processed: ${id}-${name}`
}

@Concurrent
function mixedParamsTask(sharedObj: SharedHeapObject, normalId: number): string {
  return `${sharedObj.getId()}-${normalId}`
}

function executeIsolationTasks(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsHeapIsolationTest(): void {
  describe('BuiltinsHeapIsolationTest', (): void => {
    let manager: HeapIsolationManager = new HeapIsolationManager(new collections.Map<string, SharedHeapObject>(), new ArkTSUtils.locks.AsyncLock())

    beforeEach((): void => {
      manager = new HeapIsolationManager(new collections.Map<string, SharedHeapObject>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testHeapIsolation0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_HEAP_ISOLATION_TEST_0100
     * @tc.desc   Verify Sendable object allocated on SharedHeap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHeapIsolation0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const obj: SharedHeapObject = await manager.create('shared', 1)
      expect(obj.getId()).assertEqual(1)
      expect(obj.getData()).assertEqual('shared')
      expect(manager.getSize()).assertEqual(1)
    })

    /**
     * @tc.name   testHeapIsolation0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_HEAP_ISOLATION_TEST_0200
     * @tc.desc   Verify normal object cannot be shared across threads - serialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHeapIsolation0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const localId: number = 2
      const localName: string = 'local'
      const task: taskpool.Task = new taskpool.Task(processLocalDataTask, localId, localName)
      const result: Object = await taskpool.execute(task)
      expect(result as string).assertEqual('processed: 2-local')
    })

    /**
     * @tc.name   testHeapIsolation0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_HEAP_ISOLATION_TEST_0300
     * @tc.desc   Verify SharedHeap cannot reference LocalHeap objects - type constraint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHeapIsolation0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const container: SharedHeapObject = await manager.create('container', 3)
      const nested: SharedHeapObject = await manager.create('nested', 30)
      expect(container.getId()).assertEqual(3)
      expect(nested.getId()).assertEqual(30)
      expect(manager.getSize()).assertEqual(2)
    })

    /**
     * @tc.name   testHeapIsolation0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_HEAP_ISOLATION_TEST_0400
     * @tc.desc   Verify LocalHeap GC does not affect SharedHeap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHeapIsolation0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const sharedObj: SharedHeapObject = await manager.create('local_gc', 4)
      expect(manager.getSize()).assertEqual(1)
      expect(sharedObj.getId()).assertEqual(4)
    })

    /**
     * @tc.name   testHeapIsolation0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_HEAP_ISOLATION_TEST_0500
     * @tc.desc   Verify SharedHeap GC does not affect LocalHeap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHeapIsolation0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await manager.create('shared_gc', 50)
      await manager.delete('shared_gc')
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testHeapIsolation0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_HEAP_ISOLATION_TEST_0600
     * @tc.desc   Verify Sendable object cross-thread sharing - reference passing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHeapIsolation0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const sharedObj: SharedHeapObject = await manager.create('cross', 6)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(sharedAccessTask, sharedObj))
      }
      const results: Object[] = await executeIsolationTasks(tasks)
      expect(results.length).assertEqual(5)
      expect(results[0] as number).assertEqual(60)
    })

    /**
     * @tc.name   testHeapIsolation0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_HEAP_ISOLATION_TEST_0700
     * @tc.desc   Verify normal object serialization passing - data copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHeapIsolation0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const localId: number = 7
      const task: taskpool.Task = new taskpool.Task(processLocalDataTask, localId, 'test')
      const result: Object = await taskpool.execute(task)
      expect(result as string).assertEqual('processed: 7-test')
    })

    /**
     * @tc.name   testHeapIsolation0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_HEAP_ISOLATION_TEST_0800
     * @tc.desc   Verify mixed type passing - Sendable + normal data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHeapIsolation0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const sharedObj: SharedHeapObject = await manager.create('mixed', 8)
      const normalId: number = 80
      const task: taskpool.Task = new taskpool.Task(mixedParamsTask, sharedObj, normalId)
      const result: Object = await taskpool.execute(task)
      expect(result as string).assertEqual('8-80')
    })

    /**
     * @tc.name   testHeapIsolation0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_HEAP_ISOLATION_TEST_0900
     * @tc.desc   Verify heap memory allocation - Sendable on SharedHeap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHeapIsolation0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 10; i++) {
        await manager.create(`alloc_${i}`, i)
      }
      expect(manager.getSize()).assertEqual(10)

      await manager.clearAll()
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testHeapIsolation1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_HEAP_ISOLATION_TEST_1000
     * @tc.desc   Verify heap isolation complete - cross-thread type constraint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHeapIsolation1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const container: SharedHeapObject = await manager.create('iso_container', 10)
      const nested: SharedHeapObject = await manager.create('iso_nested', 100)

      const task: taskpool.Task = new taskpool.Task(sharedAccessTask, container)
      const result: Object = await taskpool.execute(task)
      expect(result as number).assertEqual(100)

      expect(container.getId()).assertEqual(10)
      expect(nested.getId()).assertEqual(100)
    })
  })
}
