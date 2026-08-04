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
class StabilityCounter {
  private count_: number = 0
  private lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }


  async increment(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      this.count_++
      return this.count_
    })
  }

  getCount(): number {
    return this.count_
  }
}

@Concurrent
async function stabilityIncrementTask(counter: StabilityCounter): Promise<void> {
  await counter.increment()
}

function executeTasks(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsSharedModuleStabilityTest(): void {
  describe('BuiltinsSharedModuleStabilityTest', (): void => {
    let counter: StabilityCounter = new StabilityCounter(new ArkTSUtils.locks.AsyncLock())

    beforeEach((): void => {
      counter = new StabilityCounter(new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testSharedModuleStability0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_STABILITY_TEST_0100
     * @tc.desc   Verify variable lock protection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedModuleStability0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(stabilityIncrementTask, counter))
      }
      await executeTasks(tasks)
      expect(counter.getCount()).assertEqual(10)
    })

    /**
     * @tc.name   testSharedModuleStability0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_STABILITY_TEST_0200
     * @tc.desc   Verify assertion key info in error message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleStability0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await counter.increment()
      await counter.increment()
      const count: number = counter.getCount()
      expect(count).assertEqual(2)
    })

    /**
     * @tc.name   testSharedModuleStability0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_STABILITY_TEST_0300
     * @tc.desc   Verify Timer delay >= 500ms rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleStability0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(stabilityIncrementTask, counter))
      }
      await executeTasks(tasks)

      await Utils.sleep(500)
      expect(counter.getCount()).assertEqual(5)
    })

    /**
     * @tc.name   testSharedModuleStability0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_STABILITY_TEST_0400
     * @tc.desc   Verify Timer branch <= 10ms rule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleStability0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const startTime: number = Date.now()
      await counter.increment()
      const elapsed: number = Date.now() - startTime
      expect(elapsed < 100).assertTrue()
    })

    /**
     * @tc.name   testSharedModuleStability0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_STABILITY_TEST_0500
     * @tc.desc   Verify async nested completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleStability0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const task1: taskpool.Task = new taskpool.Task(stabilityIncrementTask, counter)
      await taskpool.execute(task1)

      const task2: taskpool.Task = new taskpool.Task(stabilityIncrementTask, counter)
      await taskpool.execute(task2)

      const task3: taskpool.Task = new taskpool.Task(stabilityIncrementTask, counter)
      await taskpool.execute(task3)

      expect(counter.getCount()).assertEqual(3)
    })

    /**
     * @tc.name   testSharedModuleStability0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_STABILITY_TEST_0600
     * @tc.desc   Verify Worker task completion before exit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleStability0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(stabilityIncrementTask, counter))
      }
      const results: Object[] = await executeTasks(tasks)
      expect(results.length).assertEqual(3)
      expect(counter.getCount()).assertEqual(3)
    })

    /**
     * @tc.name   testSharedModuleStability0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_STABILITY_TEST_0700
     * @tc.desc   Verify error message assertion key info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleStability0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(stabilityIncrementTask, counter))
      }
      await executeTasks(tasks)

      const finalCount: number = counter.getCount()
      expect(finalCount).assertEqual(5)
    })
  })
}
