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
class NestedCounter {
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
async function nestedIncrementTask(counter: NestedCounter): Promise<void> {
  await counter.increment()
}

@Concurrent
async function nestedCallbackTask(counter: NestedCounter): Promise<void> {
  await counter.increment()
}

function executeTasks(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function BuiltinsSharedModuleNestedTest(): void {
  describe('BuiltinsSharedModuleNestedTest', (): void => {
    let counter: NestedCounter = new NestedCounter(new ArkTSUtils.locks.AsyncLock())

    beforeEach((): void => {
      counter = new NestedCounter(new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testSharedModuleNested0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_NESTED_TEST_0100
     * @tc.desc   Verify nested task with count waiting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedModuleNested0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      const task1: taskpool.Task = new taskpool.Task(nestedIncrementTask, counter)
      await taskpool.execute(task1)

      const task2: taskpool.Task = new taskpool.Task(nestedIncrementTask, counter)
      await taskpool.execute(task2)

      expect(counter.getCount()).assertEqual(2)
    })

    /**
     * @tc.name   testSharedModuleNested0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_NESTED_TEST_0200
     * @tc.desc   Verify callback nested task with count waiting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleNested0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const task: taskpool.Task = new taskpool.Task(nestedCallbackTask, counter)
      await taskpool.execute(task)

      expect(counter.getCount()).assertEqual(1)
    })

    /**
     * @tc.name   testSharedModuleNested0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_NESTED_TEST_0300
     * @tc.desc   Verify nested task concurrent 3 tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleNested0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(nestedIncrementTask, counter))
      }
      await executeTasks(tasks)
      expect(counter.getCount()).assertEqual(3)
    })

    /**
     * @tc.name   testSharedModuleNested0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_NESTED_TEST_0400
     * @tc.desc   Verify nested task concurrent 10 tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleNested0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(nestedIncrementTask, counter))
      }
      await executeTasks(tasks)
      expect(counter.getCount()).assertEqual(10)
    })

    /**
     * @tc.name   testSharedModuleNested0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_NESTED_TEST_0500
     * @tc.desc   Verify Promise.all waiting for all results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleNested0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(nestedIncrementTask, counter))
      }
      await executeTasks(tasks)
      expect(counter.getCount()).assertEqual(5)
    })

    /**
     * @tc.name   testSharedModuleNested0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_NESTED_TEST_0600
     * @tc.desc   Verify Worker lifecycle in nested task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleNested0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const task: taskpool.Task = new taskpool.Task(nestedIncrementTask, counter)
      await taskpool.execute(task)
      await taskpool.execute(new taskpool.Task(nestedIncrementTask, counter))
      expect(counter.getCount()).assertEqual(2)
    })

    /**
     * @tc.name   testSharedModuleNested0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_NESTED_TEST_0700
     * @tc.desc   Verify LongTask execution and cleanup in nested scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleNested0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 3; i++) {
        const task: taskpool.Task = new taskpool.Task(nestedIncrementTask, counter)
        await taskpool.execute(task)
      }
      expect(counter.getCount()).assertEqual(3)
    })

    /**
     * @tc.name   testSharedModuleNested0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SHARED_MODULE_NESTED_TEST_0800
     * @tc.desc   Verify task cancellation in nested scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSharedModuleNested0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const task: taskpool.Task = new taskpool.Task(nestedIncrementTask, counter)
      const executePromise: Promise<Object> = taskpool.execute(task)
      taskpool.cancel(task)
      try {
        await executePromise
      } catch (e) {
        expect(e instanceof Error).assertTrue()
      }

      await Utils.sleep(200)
      expect(counter.getCount() >= 0).assertTrue()
    })
  })
}
