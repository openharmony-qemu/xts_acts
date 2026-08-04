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
class LeakableData {
  public id_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock


  constructor(id: number, lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_

    this.id_ = id
  }

  getId(): number {
    return this.id_
  }
}

@Sendable
class LeakDetectionManager {
  private dataMap_: collections.Map<string, LeakableData>

  private lock_: ArkTSUtils.locks.AsyncLock

  constructor(dataMap_: collections.Map<string, LeakableData>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.dataMap_ = dataMap_
    this.lock_ = lock_
  }

  private createCount_: number = 0
  private deleteCount_: number = 0

  async create(key: string, id: number): Promise<LeakableData> {
    return await this.lock_.lockAsync((): LeakableData => {
      const data: LeakableData = new LeakableData(id, this.lock_)
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

  get(key: string): LeakableData | undefined {
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
function accessLeakTask(data: LeakableData): number {
  return data.getId()
}

function executeLeakTasks(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsMemoryLeakGCTest(): void {
  describe('BuiltinsMemoryLeakGCTest', (): void => {
    let manager: LeakDetectionManager = new LeakDetectionManager(new collections.Map<string, LeakableData>(), new ArkTSUtils.locks.AsyncLock())

    beforeEach((): void => {
      manager = new LeakDetectionManager(new collections.Map<string, LeakableData>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testMemoryLeakGC0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MEMORY_LEAK_GC_TEST_0100
     * @tc.desc   Verify large number of objects created without destruction - memory growth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMemoryLeakGC0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      for (let i: number = 0; i < 100; i++) {
        await manager.create(`leak_${i}`, i)
      }
      expect(manager.getSize()).assertEqual(100)
      expect(manager.getCreateCount()).assertEqual(100)
    })

    /**
     * @tc.name   testMemoryLeakGC0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MEMORY_LEAK_GC_TEST_0200
     * @tc.desc   Verify snapshot comparison for memory leak detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMemoryLeakGC0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      expect(manager.getSize()).assertEqual(0)

      const data1: LeakableData = await manager.create('snap1', 1)
      const data2: LeakableData = await manager.create('snap2', 2)
      expect(manager.getSize()).assertEqual(2)

      await manager.delete('snap2')
      expect(manager.getSize()).assertEqual(1)
      expect(data1.getId()).assertEqual(1)
    })

    /**
     * @tc.name   testMemoryLeakGC0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MEMORY_LEAK_GC_TEST_0300
     * @tc.desc   Verify circular reference detection - reference count not zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMemoryLeakGC0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data1: LeakableData = await manager.create('circular_a', 1)
      const data2: LeakableData = await manager.create('circular_b', 2)
      expect(manager.getSize()).assertEqual(2)

      await manager.delete('circular_a')
      await manager.delete('circular_b')
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testMemoryLeakGC0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MEMORY_LEAK_GC_TEST_0400
     * @tc.desc   Verify long-running memory stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMemoryLeakGC0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let cycle: number = 0; cycle < 10; cycle++) {
        for (let i: number = 0; i < 10; i++) {
          await manager.create(`stable_${cycle}_${i}`, cycle * 10 + i)
        }
        for (let i: number = 0; i < 10; i++) {
          await manager.delete(`stable_${cycle}_${i}`)
        }
      }
      expect(manager.getCreateCount()).assertEqual(100)
      expect(manager.getDeleteCount()).assertEqual(100)
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testMemoryLeakGC0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MEMORY_LEAK_GC_TEST_0500
     * @tc.desc   Verify memory leak threshold detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMemoryLeakGC0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 50; i++) {
        await manager.create(`threshold_${i}`, i)
      }
      expect(manager.getSize()).assertEqual(50)

      await manager.clearAll()
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testMemoryLeakGC0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MEMORY_LEAK_GC_TEST_0600
     * @tc.desc   Verify TaskPool task holding reference causing leak
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMemoryLeakGC0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: LeakableData = await manager.create('task_ref', 100)
      await manager.create('task_new', 200)
      const task: taskpool.Task = new taskpool.Task(accessLeakTask, data)
      const result: Object = await taskpool.execute(task)
      expect(result as number).assertEqual(100)
      expect(manager.getSize()).assertEqual(2)
    })

    /**
     * @tc.name   testMemoryLeakGC0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MEMORY_LEAK_GC_TEST_0700
     * @tc.desc   Verify nested reference causing memory leak
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMemoryLeakGC0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const parent: LeakableData = await manager.create('nested_parent', 1)
      const child: LeakableData = await manager.create('nested_child', 10)
      expect(manager.getSize()).assertEqual(2)

      await manager.delete('nested_child')
      expect(manager.getSize()).assertEqual(1)
      expect(parent.getId()).assertEqual(1)
    })

    /**
     * @tc.name   testMemoryLeakGC0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MEMORY_LEAK_GC_TEST_0800
     * @tc.desc   Verify collections container holding reference leak detection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMemoryLeakGC0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const container: collections.Array<LeakableData> = new collections.Array<LeakableData>()
      for (let i: number = 0; i < 10; i++) {
        const data: LeakableData = await manager.create(`container_${i}`, i)
        container.push(data)
      }
      expect(manager.getSize()).assertEqual(10)
      expect(container.length).assertEqual(10)

      while (container.length > 0) {
        container.pop()
      }
      expect(container.length).assertEqual(0)

      for (let i: number = 0; i < 10; i++) {
        await manager.delete(`container_${i}`)
      }
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testMemoryLeakGC0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MEMORY_LEAK_GC_TEST_0900
     * @tc.desc   Verify memory leak fix - correct reference release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMemoryLeakGC0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: LeakableData = await manager.create('fix_leak', 999)
      expect(manager.getSize()).assertEqual(1)

      await manager.delete('fix_leak')
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   testMemoryLeakGC1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_MEMORY_LEAK_GC_TEST_1000
     * @tc.desc   Verify concurrent access and sequential delete does not leak
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMemoryLeakGC1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 20; i++) {
        await manager.create(`concurrent_${i}`, i)
      }
      expect(manager.getSize()).assertEqual(20)

      const data0: LeakableData | undefined = manager.get('concurrent_0')
      expect(data0 !== undefined).assertTrue()
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(accessLeakTask, data0!))
      }
      const results: Object[] = await executeLeakTasks(tasks)
      expect(results.length).assertEqual(5)

      for (let i: number = 0; i < 10; i++) {
        await manager.delete(`concurrent_${i}`)
      }
      expect(manager.getSize()).assertEqual(10)
    })
  })
}
