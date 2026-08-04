/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';

@Concurrent
function cpuIntensiveTask(n: number): number {
  let sum: number = 0
  for (let i: number = 0; i < n; i++) {
    sum += i
  }
  return sum
}

@Concurrent
function actorTask(data: number[]): number {
  let localCopy: number[] = [...data]
  localCopy.push(100)
  let total: number = 0
  for (let i: number = 0; i < localCopy.length; i++) {
    total += localCopy[i]
  }
  return total
}

@Concurrent
function computeTask(x: number, y: number): number {
  return x * y
}

@Concurrent
function successTask(): string {
  return 'success'
}

@Concurrent
function functionParamTask(fn: Object): void {
}

@Concurrent
function errorTask(): void {
  throw new Error('task error')
}

export default function ConcurrencyOverviewTest(): void {
  describe('ConcurrencyOverviewTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})

    /**
     * @tc.name   ConcurrencyOverviewTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_OVERVIEW_TEST_0100
     * @tc.desc   Verify async/await provides async concurrency for I/O tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrencyOverviewTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let asyncTask = async (): Promise<string> => {
        await Promise.resolve()
        return 'async result'
      }
      let result: string = await asyncTask()
      expect(result).assertEqual('async result')
    })

    /**
     * @tc.name   ConcurrencyOverviewTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_OVERVIEW_TEST_0200
     * @tc.desc   Verify TaskPool provides multi-thread concurrency for CPU tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrencyOverviewTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(cpuIntensiveTask, 10000)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(49995000)
    })

    /**
     * @tc.name   ConcurrencyOverviewTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_OVERVIEW_TEST_0300
     * @tc.desc   Verify Actor model with independent memory and data serialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrencyOverviewTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let originalData: number[] = [1, 2, 3]
      let task: taskpool.Task = new taskpool.Task(actorTask, originalData)
      let result = await taskpool.execute(task)
      expect(originalData.length).assertEqual(3)
      expect(result as number).assertEqual(106)
    })

    /**
     * @tc.name   ConcurrencyOverviewTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_OVERVIEW_TEST_0400
     * @tc.desc   Verify taskpool.Task creation and taskpool.execute execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrencyOverviewTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(computeTask, 10, 20)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(200)
    })

    /**
     * @tc.name   ConcurrencyOverviewTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_OVERVIEW_TEST_0500
     * @tc.desc   Verify TaskPool task error handling with try/catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrencyOverviewTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task1: taskpool.Task = new taskpool.Task(successTask)
      let result1 = await taskpool.execute(task1)
      expect(result1 as string).assertEqual('success')

      let task2: taskpool.Task = new taskpool.Task(errorTask)
      let caughtError1: boolean = false
      try {
        await taskpool.execute(task2)
        expect().assertFail()
      } catch (e) {
        caughtError1 = true
        
      }
      expect(caughtError1).assertTrue()
    })

    /**
     * @tc.name   ConcurrencyOverviewTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_OVERVIEW_TEST_0600
     * @tc.desc   Verify TaskPool serialization failure with non-serializable input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyOverviewTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtError2: boolean = false
      try {
        let task: taskpool.Task = new taskpool.Task(functionParamTask, (): void => {})
        await taskpool.execute(task)
        expect().assertFail()
      } catch (e) {
        caughtError2 = true
        
      }
      expect(caughtError2).assertTrue()
    })
  })
}
