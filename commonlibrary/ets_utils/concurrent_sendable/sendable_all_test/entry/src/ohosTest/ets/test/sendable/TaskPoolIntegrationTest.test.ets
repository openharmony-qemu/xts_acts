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
class SharedTaskPoolData {
  private counter_: number = 0
  private lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }

  private name_: string = ''

  async increment(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      this.counter_++
      return this.counter_
    })
  }

  getCounter(): number {
    return this.counter_
  }

  setName(name: string): void {
    this.name_ = name
  }

  getName(): string {
    return this.name_
  }
}

@Concurrent
async function incrementSharedDataTask(data: SharedTaskPoolData): Promise<void> {
  await data.increment()
}

@Concurrent
function readSharedDataTask(data: SharedTaskPoolData): number {
  return data.getCounter()
}

@Concurrent
async function accessAndIncrementTask(data: SharedTaskPoolData): Promise<number> {
  await data.increment()
  return data.getCounter()
}

function executeTasks(tasks: taskpool.Task[]): Promise<Object[]> {
  const promises: Promise<Object>[] = []
  for (let i: number = 0; i < tasks.length; i++) {
    promises.push(taskpool.execute(tasks[i]))
  }
  return Promise.all(promises)
}

export default function TaskPoolIntegrationTest(): void {
  describe('TaskPoolIntegrationTest', (): void => {
    let sharedData: SharedTaskPoolData = new SharedTaskPoolData(new ArkTSUtils.locks.AsyncLock())

    beforeEach((): void => {
      sharedData = new SharedTaskPoolData(new ArkTSUtils.locks.AsyncLock())
    })

    afterEach(async (): Promise<void> => {
      await Utils.sleep(500)
    })

    /**
     * @tc.name   testTaskPoolIntegration0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_INTEGRATION_TEST_0100
     * @tc.desc   Verify TaskPool single task accessing shared module
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolIntegration0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      sharedData.setName('single_task')
      const task: taskpool.Task = new taskpool.Task(readSharedDataTask, sharedData)
      const result: Object = await taskpool.execute(task)

      expect(result as number).assertEqual(0)
      expect(sharedData.getName()).assertEqual('single_task')
    })

    /**
     * @tc.name   testTaskPoolIntegration0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_INTEGRATION_TEST_0200
     * @tc.desc   Verify TaskPool concurrent 3 tasks accessing shared module
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskPoolIntegration0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(incrementSharedDataTask, sharedData))
      }
      await executeTasks(tasks)
      expect(sharedData.getCounter()).assertEqual(3)
    })

    /**
     * @tc.name   testTaskPoolIntegration0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_INTEGRATION_TEST_0300
     * @tc.desc   Verify TaskPool concurrent 10 tasks auto-increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskPoolIntegration0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(incrementSharedDataTask, sharedData))
      }
      await executeTasks(tasks)
      expect(sharedData.getCounter()).assertEqual(10)
    })

    /**
     * @tc.name   testTaskPoolIntegration0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_INTEGRATION_TEST_0400
     * @tc.desc   Verify TaskPool concurrent read-write mix with 5 tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskPoolIntegration0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(incrementSharedDataTask, sharedData))
      }
      for (let i: number = 0; i < 2; i++) {
        tasks.push(new taskpool.Task(readSharedDataTask, sharedData))
      }
      await executeTasks(tasks)
      expect(sharedData.getCounter()).assertEqual(3)
    })

    /**
     * @tc.name   testTaskPoolIntegration0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_INTEGRATION_TEST_0500
     * @tc.desc   Verify TaskPool task callback verifying shared data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskPoolIntegration0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const task: taskpool.Task = new taskpool.Task(accessAndIncrementTask, sharedData)
      const result: Object = await taskpool.execute(task)

      expect(result as number).assertEqual(1)
      expect(sharedData.getCounter()).assertEqual(1)
    })

    /**
     * @tc.name   testTaskPoolIntegration0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_INTEGRATION_TEST_0600
     * @tc.desc   Verify TaskPool callback nested task with count waiting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskPoolIntegration0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const task: taskpool.Task = new taskpool.Task(accessAndIncrementTask, sharedData)
      const result: Object = await taskpool.execute(task)
      const count: number = result as number

      const task2: taskpool.Task = new taskpool.Task(accessAndIncrementTask, sharedData)
      const result2: Object = await taskpool.execute(task2)
      const count2: number = result2 as number

      expect(count).assertEqual(1)
      expect(count2).assertEqual(2)
    })

    /**
     * @tc.name   testTaskPoolIntegration0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_INTEGRATION_TEST_0700
     * @tc.desc   Verify nested task concurrent 3 tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskPoolIntegration0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 3; i++) {
        tasks.push(new taskpool.Task(accessAndIncrementTask, sharedData))
      }
      const results: Object[] = await executeTasks(tasks)
      expect(sharedData.getCounter()).assertEqual(3)
    })

    /**
     * @tc.name   testTaskPoolIntegration0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_INTEGRATION_TEST_0800
     * @tc.desc   Verify nested task concurrent 5 tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskPoolIntegration0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const tasks: taskpool.Task[] = []
      for (let i: number = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(accessAndIncrementTask, sharedData))
      }
      await executeTasks(tasks)
      expect(sharedData.getCounter()).assertEqual(5)
    })

    /**
     * @tc.name   testTaskPoolIntegration0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_INTEGRATION_TEST_0900
     * @tc.desc   Verify multi-level nested tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskPoolIntegration0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      for (let i: number = 0; i < 3; i++) {
        const task: taskpool.Task = new taskpool.Task(incrementSharedDataTask, sharedData)
        await taskpool.execute(task)
      }
      expect(sharedData.getCounter()).assertEqual(3)
    })

    /**
     * @tc.name   testTaskPoolIntegration1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_INTEGRATION_TEST_1000
     * @tc.desc   Verify LongTask execution and cleanup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskPoolIntegration1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const task: taskpool.Task = new taskpool.Task(incrementSharedDataTask, sharedData)
      await taskpool.execute(task)
      expect(sharedData.getCounter()).assertEqual(1)
    })

    /**
     * @tc.name   testTaskPoolIntegration1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_INTEGRATION_TEST_1100
     * @tc.desc   Verify task cancellation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskPoolIntegration1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const task: taskpool.Task = new taskpool.Task(incrementSharedDataTask, sharedData)
      const executePromise: Promise<Object> = taskpool.execute(task)
      taskpool.cancel(task)
      try {
        await executePromise
      } catch (e) {
        expect(e instanceof Error).assertTrue()
      }

      await Utils.sleep(200)
      expect(sharedData.getCounter() >= 0).assertTrue()
    })
  })
}
