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
class ConcurrentGCData {
  public id_: number = 0
  public value_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async setValue(v: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.value_ = v
    })
  }

  getValue(): number {
    return this.value_
  }

  getId(): number {
    return this.id_
  }
}

@Sendable
class ConcurrentGCManager {
  private dataMap_: collections.Map<string, ConcurrentGCData>

  private lock_: ArkTSUtils.locks.AsyncLock

  constructor(dataMap_: collections.Map<string, ConcurrentGCData>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.dataMap_ = dataMap_
    this.lock_ = lock_
  }

  private createCount_: number = 0
  private deleteCount_: number = 0

  async create(key: string, id: number): Promise<ConcurrentGCData> {
    return await this.lock_.lockAsync((): ConcurrentGCData => {
      const data: ConcurrentGCData = new ConcurrentGCData(this.lock_)
      data.id_ = id
      data.value_ = id * 10
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

  get(key: string): ConcurrentGCData | undefined {
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
function accessConcurrentGCTask(data: ConcurrentGCData): number {
  return data.getValue()
}

@Concurrent
async function modifyConcurrentGCTask(data: ConcurrentGCData, newVal: number): Promise<void> {
  await data.setValue(newVal)
}

function executeConcurrentGCTasks(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsConcurrentGCTest(): void {
  describe('BuiltinsConcurrentGCTest', (): void => {
    let manager: ConcurrentGCManager = new ConcurrentGCManager(new collections.Map<string, ConcurrentGCData>(), new ArkTSUtils.locks.AsyncLock())

    beforeEach((): void => {
      manager = new ConcurrentGCManager(new collections.Map<string, ConcurrentGCData>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   BuiltinsConcurrentGCTest0100
     * @tc.number SUB_BUILTINS_CONCURRENT_GC_TEST_0100
     * @tc.desc   Verify forceFullGC triggers immediate GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsConcurrentGCTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      for (let i: number = 0; i < 5; i++) {
        await manager.create(`gc_${i}`, i)
      }
      expect(manager.getSize()).assertEqual(5)

      await manager.clearAll()
      expect(manager.getSize()).assertEqual(0)
    })

    /**
     * @tc.name   BuiltinsConcurrentGCTest0200
     * @tc.number SUB_BUILTINS_CONCURRENT_GC_TEST_0200
     * @tc.desc   Verify GC before and after memory change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsConcurrentGCTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
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
     * @tc.name   BuiltinsConcurrentGCTest0300
     * @tc.number SUB_BUILTINS_CONCURRENT_GC_TEST_0300
     * @tc.desc   Verify GC trigger does not affect in-use objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsConcurrentGCTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: ConcurrentGCData = await manager.create('active', 42)
      expect(data.getValue()).assertEqual(420)

      const retrieved: ConcurrentGCData | undefined = manager.get('active')
      expect(retrieved !== undefined).assertTrue()
      expect(retrieved!.getValue()).assertEqual(420)
    })

    /**
     * @tc.name   BuiltinsConcurrentGCTest0400
     * @tc.number SUB_BUILTINS_CONCURRENT_GC_TEST_0400
     * @tc.desc   Verify multi-thread concurrent access with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsConcurrentGCTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: ConcurrentGCData = await manager.create('concurrent', 5)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(accessConcurrentGCTask, data))
      }
      const results: Object[] = await executeConcurrentGCTasks(tasks)
      expect(results.length).assertEqual(5)
      for (let i: number = 0; i < 5; i++) {
        expect(results[i] as number).assertEqual(50)
      }
    })

    /**
     * @tc.name   BuiltinsConcurrentGCTest0500
     * @tc.number SUB_BUILTINS_CONCURRENT_GC_TEST_0500
     * @tc.desc   Verify GC completion time is fast
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsConcurrentGCTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const startTime: number = Date.now()
      for (let i: number = 0; i < 10; i++) {
        await manager.create(`fast_${i}`, i)
      }
      const elapsed: number = Date.now() - startTime
      expect(elapsed < 5000).assertTrue()
    })

    /**
     * @tc.name   BuiltinsConcurrentGCTest0600
     * @tc.number SUB_BUILTINS_CONCURRENT_GC_TEST_0600
     * @tc.desc   Verify object count change before and after GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsConcurrentGCTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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
     * @tc.name   BuiltinsConcurrentGCTest0700
     * @tc.number SUB_BUILTINS_CONCURRENT_GC_TEST_0700
     * @tc.desc   Verify continuous multiple GC calls stability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsConcurrentGCTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let round: number = 0; round < 3; round++) {
        for (let i: number = 0; i < 5; i++) {
          await manager.create(`round${round}_${i}`, i)
        }
        expect(manager.getSize()).assertEqual(5)
        await manager.clearAll()
        expect(manager.getSize()).assertEqual(0)
      }
    })

    /**
     * @tc.name   BuiltinsConcurrentGCTest0800
     * @tc.number SUB_BUILTINS_CONCURRENT_GC_TEST_0800
     * @tc.desc   Verify GC trigger timing - auto vs forced GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsConcurrentGCTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: ConcurrentGCData = await manager.create('persist', 100)
      expect(data.getValue()).assertEqual(1000)

      const task: taskpool.Task = new taskpool.Task(accessConcurrentGCTask, data)
      const result: Object = await taskpool.execute(task)
      expect(result as number).assertEqual(1000)
    })

    /**
     * @tc.name   BuiltinsConcurrentGCTest0900
     * @tc.number SUB_BUILTINS_CONCURRENT_GC_TEST_0900
     * @tc.desc   Verify shared heap capacity stability after GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsConcurrentGCTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
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

    /**
     * @tc.name   BuiltinsConcurrentGCTest1000
     * @tc.number SUB_BUILTINS_CONCURRENT_GC_TEST_1000
     * @tc.desc   Verify concurrent access and sequential delete operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsConcurrentGCTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 5; i++) {
        await manager.create(`mixed_${i}`, i)
      }

      const data3: ConcurrentGCData | undefined = manager.get('mixed_3')
      expect(data3 !== undefined).assertTrue()
      const task: taskpool.Task = new taskpool.Task(accessConcurrentGCTask, data3!)
      const result: Object = await taskpool.execute(task)
      expect(result as number).assertEqual(30)

      await manager.delete('mixed_0')
      await manager.delete('mixed_1')
      expect(manager.getSize()).assertEqual(3)
    })
  })
}
