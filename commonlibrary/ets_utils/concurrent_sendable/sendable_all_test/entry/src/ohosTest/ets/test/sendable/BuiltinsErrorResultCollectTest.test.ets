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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { collections, ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class ErrorResultCollector {
  public successResults_: collections.Array<string>

  public failedResults_: collections.Array<string>

  public errorMessages_: collections.Map<number, string>

  public taskStatus_: collections.Map<number, string>

  public retryCount_: collections.Map<number, number>

  public timeoutResults_: collections.Array<number>

  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(successResults_: collections.Array<string>, failedResults_: collections.Array<string>, errorMessages_: collections.Map<number, string>, taskStatus_: collections.Map<number, string>, retryCount_: collections.Map<number, number>, timeoutResults_: collections.Array<number>, lock_: ArkTSUtils.locks.AsyncLock) {
    this.successResults_ = successResults_
    this.failedResults_ = failedResults_
    this.errorMessages_ = errorMessages_
    this.taskStatus_ = taskStatus_
    this.retryCount_ = retryCount_
    this.timeoutResults_ = timeoutResults_
    this.lock_ = lock_
  }


  async addSuccessResult(taskId: number, result: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.successResults_.push(result)
      this.taskStatus_.set(taskId, 'success')
    })
  }

  async addFailedResult(taskId: number, errorMsg: string): Promise<void> {
    await this.lock_.lockAsync((): void => {
      this.failedResults_.push(errorMsg)
      this.errorMessages_.set(taskId, errorMsg)
      this.taskStatus_.set(taskId, 'failed')
    })
  }

  addTimeoutResult(taskId: number): void {
    this.timeoutResults_.push(taskId)
    this.taskStatus_.set(taskId, 'timeout')
  }

  incrementRetryCount(taskId: number): void {
    let current: number | undefined = this.retryCount_.get(taskId)
    if (current === undefined) {
      current = 0
    }
    this.retryCount_.set(taskId, current + 1)
  }

  getSuccessCount(): number {
    return this.successResults_.length
  }

  getFailedCount(): number {
    return this.failedResults_.length
  }

  getErrorMessage(taskId: number): string | undefined {
    return this.errorMessages_.get(taskId)
  }

  getTaskStatus(taskId: number): string | undefined {
    return this.taskStatus_.get(taskId)
  }

  getRetryCount(taskId: number): number | undefined {
    return this.retryCount_.get(taskId)
  }

  getTimeoutResults(): collections.Array<number> {
    return this.timeoutResults_
  }

  getTotalCount(): number {
    return this.successResults_.length + this.failedResults_.length
  }

  clear(): void {
    while (this.successResults_.length > 0) { this.successResults_.pop() }
    while (this.failedResults_.length > 0) { this.failedResults_.pop() }
    this.errorMessages_.clear()
    this.taskStatus_.clear()
    this.retryCount_.clear()
    while (this.timeoutResults_.length > 0) { this.timeoutResults_.pop() }
  }
}

@Concurrent
function successTask(taskId: number): string {
  return `success_${taskId}`
}

@Concurrent
function failTask(taskId: number): string {
  return 'FAIL'
}

export default function BuiltinsErrorResultCollectTest(): void {
  describe('BuiltinsErrorResultCollectTest', (): void => {
    let collector: ErrorResultCollector

    beforeEach((): void => {
      collector = new ErrorResultCollector(new collections.Array<string>(), new collections.Array<string>(), new collections.Map<number, string>(), new collections.Map<number, string>(), new collections.Map<number, number>(), new collections.Array<number>(), new ArkTSUtils.locks.AsyncLock())
    })
    /**
     * @tc.name   testErrorResultCollect0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ERROR_RESULT_COLLECT_TEST_0100
     * @tc.desc   Verify success result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testErrorResultCollect0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await collector.addSuccessResult(1, 'success_1')
      expect(collector.getSuccessCount()).assertEqual(1)
      expect(collector.getTaskStatus(1)).assertEqual('success')
    })

    /**
     * @tc.name   testErrorResultCollect0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ERROR_RESULT_COLLECT_TEST_0200
     * @tc.desc   Verify failure result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testErrorResultCollect0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await collector.addFailedResult(1, 'execution_error')
      expect(collector.getFailedCount()).assertEqual(1)
      expect(collector.getTaskStatus(1)).assertEqual('failed')
    })

    /**
     * @tc.name   testErrorResultCollect0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ERROR_RESULT_COLLECT_TEST_0300
     * @tc.desc   Verify success and failure count statistics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testErrorResultCollect0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await collector.addSuccessResult(1, 'ok_1')
      await collector.addSuccessResult(2, 'ok_2')
      await collector.addFailedResult(3, 'err_3')
      expect(collector.getSuccessCount()).assertEqual(2)
      expect(collector.getFailedCount()).assertEqual(1)
      expect(collector.getTotalCount()).assertEqual(3)
    })

    /**
     * @tc.name   testErrorResultCollect0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ERROR_RESULT_COLLECT_TEST_0400
     * @tc.desc   Verify error message storage and query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testErrorResultCollect0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await collector.addFailedResult(1, 'timeout_error')
      await collector.addFailedResult(2, 'network_error')
      expect(collector.getErrorMessage(1)).assertEqual('timeout_error')
      expect(collector.getErrorMessage(2)).assertEqual('network_error')
    })

    /**
     * @tc.name   testErrorResultCollect0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ERROR_RESULT_COLLECT_TEST_0500
     * @tc.desc   Verify task status management
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testErrorResultCollect0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      await collector.addSuccessResult(1, 'ok')
      await collector.addFailedResult(2, 'err')
      collector.addTimeoutResult(3)
      expect(collector.getTaskStatus(1)).assertEqual('success')
      expect(collector.getTaskStatus(2)).assertEqual('failed')
      expect(collector.getTaskStatus(3)).assertEqual('timeout')
    })

    /**
     * @tc.name   testErrorResultCollect0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ERROR_RESULT_COLLECT_TEST_0600
     * @tc.desc   Verify retry count tracking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorResultCollect0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      collector.incrementRetryCount(1)
      collector.incrementRetryCount(1)
      collector.incrementRetryCount(1)
      expect(collector.getRetryCount(1)).assertEqual(3)
    })

    /**
     * @tc.name   testErrorResultCollect0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ERROR_RESULT_COLLECT_TEST_0700
     * @tc.desc   Verify TaskPool success task result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testErrorResultCollect0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const task = new taskpool.Task(successTask, 1)
      const result: Object = await taskpool.execute(task)
      await collector.addSuccessResult(1, result as string)
      expect(collector.getSuccessCount()).assertEqual(1)
      expect(collector.getTaskStatus(1)).assertEqual('success')
    })

    /**
     * @tc.name   testErrorResultCollect0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ERROR_RESULT_COLLECT_TEST_0800
     * @tc.desc   Verify TaskPool failed task result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testErrorResultCollect0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const task = new taskpool.Task(failTask, 1)
      await taskpool.execute(task)
      await collector.addFailedResult(1, 'task_execution_error')
      expect(collector.getFailedCount()).assertEqual(1)
      expect(collector.getErrorMessage(1)).assertEqual('task_execution_error')
    })

    /**
     * @tc.name   testErrorResultCollect0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ERROR_RESULT_COLLECT_TEST_0900
     * @tc.desc   Verify mixed success and failure task results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorResultCollect0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const successTasks: taskpool.Task[] = []
      const failTasks: taskpool.Task[] = []
      for (let i = 0; i < 6; i++) {
        if (i % 2 === 0) {
          successTasks.push(new taskpool.Task(successTask, i))
        } else {
          failTasks.push(new taskpool.Task(failTask, i))
        }
      }
      const successPromises: Promise<Object>[] = []
      const failPromises: Promise<Object>[] = []
      for (let i = 0; i < successTasks.length; i++) {
        successPromises.push(taskpool.execute(successTasks[i]))
      }
      for (let i = 0; i < failTasks.length; i++) {
        failPromises.push(taskpool.execute(failTasks[i]))
      }
      const successResults: Object[] = await Promise.all(successPromises)
      const failResults: Object[] = await Promise.all(failPromises)
      for (let i = 0; i < successResults.length; i++) {
        await collector.addSuccessResult(i * 2, successResults[i] as string)
      }
      for (let i = 0; i < failResults.length; i++) {
        await collector.addFailedResult(i * 2 + 1, 'task_execution_error')
      }
      expect(collector.getSuccessCount()).assertEqual(3)
      expect(collector.getFailedCount()).assertEqual(3)
    })

    /**
     * @tc.name   testErrorResultCollect1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ERROR_RESULT_COLLECT_TEST_1000
     * @tc.desc   Verify failed task ID list retrieval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorResultCollect1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await collector.addFailedResult(1, 'error_1')
      await collector.addFailedResult(2, 'error_2')
      await collector.addSuccessResult(3, 'ok_3')
      expect(collector.getErrorMessage(1)).assertEqual('error_1')
      expect(collector.getErrorMessage(2)).assertEqual('error_2')
      expect(collector.getErrorMessage(3) === undefined).assertTrue()
    })

    /**
     * @tc.name   testErrorResultCollect1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ERROR_RESULT_COLLECT_TEST_1100
     * @tc.desc   Verify timeout result marking
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorResultCollect1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      collector.addTimeoutResult(1)
      collector.addTimeoutResult(2)
      const timeoutResults: collections.Array<number> = collector.getTimeoutResults()
      expect(timeoutResults.length).assertEqual(2)
      expect(collector.getTaskStatus(1)).assertEqual('timeout')
      expect(collector.getTaskStatus(2)).assertEqual('timeout')
    })

    /**
     * @tc.name   testErrorResultCollect1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ERROR_RESULT_COLLECT_TEST_1200
     * @tc.desc   Verify retry then success scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testErrorResultCollect1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await collector.addFailedResult(1, 'error')
      collector.incrementRetryCount(1)
      collector.incrementRetryCount(1)
      await collector.addSuccessResult(1, 'success_after_retry')
      expect(collector.getRetryCount(1)).assertEqual(2)
      expect(collector.getTaskStatus(1)).assertEqual('success')
    })

    /**
     * @tc.name   testErrorResultCollect1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ERROR_RESULT_COLLECT_TEST_1300
     * @tc.desc   Verify concurrent 10 tasks error result collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testErrorResultCollect1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const successTasks: taskpool.Task[] = []
      const failTasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        if (i < 7) {
          successTasks.push(new taskpool.Task(successTask, i))
        } else {
          failTasks.push(new taskpool.Task(failTask, i))
        }
      }
      const successPromises: Promise<Object>[] = []
      const failPromises: Promise<Object>[] = []
      for (let i = 0; i < successTasks.length; i++) {
        successPromises.push(taskpool.execute(successTasks[i]))
      }
      for (let i = 0; i < failTasks.length; i++) {
        failPromises.push(taskpool.execute(failTasks[i]))
      }
      const successResults: Object[] = await Promise.all(successPromises)
      const failResults: Object[] = await Promise.all(failPromises)
      for (let i = 0; i < successResults.length; i++) {
        await collector.addSuccessResult(i, successResults[i] as string)
      }
      for (let i = 0; i < failResults.length; i++) {
        await collector.addFailedResult(7 + i, 'task_execution_error')
      }
      expect(collector.getTotalCount()).assertEqual(10)
      expect(collector.getSuccessCount()).assertEqual(7)
      expect(collector.getFailedCount()).assertEqual(3)
    })
  })
}
