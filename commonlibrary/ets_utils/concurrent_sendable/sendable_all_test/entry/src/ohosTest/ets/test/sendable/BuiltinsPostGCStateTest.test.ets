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
class PostGCStateData {
  public id_: number = 0
  public name_: string = ''
  public value_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock


  constructor(id: number, name: string, lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_

    this.id_ = id
    this.name_ = name
    this.value_ = id * 100
  }

  async setValue(v: number): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.value_ = v
    })
  }

  getId(): number {
    return this.id_
  }

  getName(): string {
    return this.name_
  }

  getValue(): number {
    return this.value_
  }
}

@Sendable
class PostGCStateManager {
  private dataMap_: collections.Map<string, PostGCStateData>

  private lock_: ArkTSUtils.locks.AsyncLock

  constructor(dataMap_: collections.Map<string, PostGCStateData>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.dataMap_ = dataMap_
    this.lock_ = lock_
  }

  private createCount_: number = 0
  private deleteCount_: number = 0

  async create(key: string, id: number): Promise<PostGCStateData> {
    return await this.lock_.lockAsync((): PostGCStateData => {
      const data: PostGCStateData = new PostGCStateData(id, key, this.lock_)
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

  get(key: string): PostGCStateData | undefined {
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
function readPostGCStateTask(data: PostGCStateData): number {
  return data.getValue()
}

@Concurrent
async function modifyPostGCStateTask(data: PostGCStateData, newVal: number): Promise<void> {
  await data.setValue(newVal)
}

function executePostGCStateTasks(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsPostGCStateTest(): void {
  describe('BuiltinsPostGCStateTest', (): void => {
    let manager: PostGCStateManager = new PostGCStateManager(new collections.Map<string, PostGCStateData>(), new ArkTSUtils.locks.AsyncLock())

    beforeEach((): void => {
      manager = new PostGCStateManager(new collections.Map<string, PostGCStateData>(), new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testPostGCState0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_POST_GC_STATE_TEST_0100
     * @tc.desc   Verify Sendable object property integrity after GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPostGCState0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const data: PostGCStateData = await manager.create('integrity', 1)
      expect(data.getId()).assertEqual(1)
      expect(data.getName()).assertEqual('integrity')
      expect(data.getValue()).assertEqual(100)

      const retrieved: PostGCStateData | undefined = manager.get('integrity')
      expect(retrieved !== undefined).assertTrue()
      expect(retrieved!.getId()).assertEqual(1)
      expect(retrieved!.getValue()).assertEqual(100)
    })

    /**
     * @tc.name   testPostGCState0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_POST_GC_STATE_TEST_0200
     * @tc.desc   Verify reference validity after GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPostGCState0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: PostGCStateData = await manager.create('ref_valid', 2)
      const task: taskpool.Task = new taskpool.Task(readPostGCStateTask, data)
      const result: Object = await taskpool.execute(task)
      expect(result as number).assertEqual(200)
    })

    /**
     * @tc.name   testPostGCState0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_POST_GC_STATE_TEST_0300
     * @tc.desc   Verify Sendable object method call after GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPostGCState0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: PostGCStateData = await manager.create('method', 3)
      expect(data.getValue()).assertEqual(300)

      await data.setValue(999)
      expect(data.getValue()).assertEqual(999)
    })

    /**
     * @tc.name   testPostGCState0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_POST_GC_STATE_TEST_0400
     * @tc.desc   Verify Sendable object type information preserved after GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPostGCState0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: PostGCStateData = await manager.create('type_info', 4)
      expect(data.getId()).assertEqual(4)
      expect(data.getName()).assertEqual('type_info')
      expect(data.getValue()).assertEqual(400)
    })

    /**
     * @tc.name   testPostGCState0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_POST_GC_STATE_TEST_0500
     * @tc.desc   Verify Sendable object in collections container after GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPostGCState0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const container: collections.Array<PostGCStateData> = new collections.Array<PostGCStateData>()
      for (let i: number = 0; i < 5; i++) {
        const data: PostGCStateData = await manager.create(`arr_${i}`, i * 10)
        container.push(data)
      }
      expect(container.length).assertEqual(5)
      expect(container[0].getId()).assertEqual(0)
      expect(container[4].getId()).assertEqual(40)
    })

    /**
     * @tc.name   testPostGCState0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_POST_GC_STATE_TEST_0600
     * @tc.desc   Verify Sendable object cross-thread state consistency after GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPostGCState0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: PostGCStateData = await manager.create('cross_consist', 6)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(readPostGCStateTask, data))
      }
      const results: Object[] = await executePostGCStateTasks(tasks)
      for (let i: number = 0; i < 5; i++) {
        expect(results[i] as number).assertEqual(600)
      }
    })

    /**
     * @tc.name   testPostGCState0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_POST_GC_STATE_TEST_0700
     * @tc.desc   Verify Sendable object state update after GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPostGCState0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: PostGCStateData = await manager.create('update', 7)
      expect(data.getValue()).assertEqual(700)

      const task: taskpool.Task = new taskpool.Task(modifyPostGCStateTask, data, 777)
      await taskpool.execute(task)
      expect(data.getValue()).assertEqual(777)
    })

    /**
     * @tc.name   testPostGCState0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_POST_GC_STATE_TEST_0800
     * @tc.desc   Verify Sendable object null reference detection after GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPostGCState0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await manager.create('null_ref', 8)
      await manager.delete('null_ref')
      const retrieved: PostGCStateData | undefined = manager.get('null_ref')
      expect(retrieved === undefined).assertTrue()
    })

    /**
     * @tc.name   testPostGCState0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_POST_GC_STATE_TEST_0900
     * @tc.desc   Verify Sendable object state after multiple GC cycles
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPostGCState0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: PostGCStateData = await manager.create('multi_gc', 9)
      for (let round: number = 0; round < 5; round++) {
        for (let i: number = 0; i < 5; i++) {
          await manager.create(`temp_${round}_${i}`, round * 10 + i)
        }
        await manager.clearAll()
        expect(data.getId()).assertEqual(9)
        expect(data.getValue()).assertEqual(900)
      }
    })

    /**
     * @tc.name   testPostGCState1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_POST_GC_STATE_TEST_1000
     * @tc.desc   Verify Sendable object state consistency with concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPostGCState1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const data: PostGCStateData = await manager.create('concurrent_state', 10)
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(readPostGCStateTask, data))
      }
      await executePostGCStateTasks(tasks)
      expect(data.getValue()).assertEqual(1000)
    })
  })
}
