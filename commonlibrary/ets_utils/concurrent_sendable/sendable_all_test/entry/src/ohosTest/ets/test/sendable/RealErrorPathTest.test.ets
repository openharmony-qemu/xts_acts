/*
 * Copyright (c) 2026 RKH Corp.
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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ArkTSUtils } from '@kit.ArkTS'
import Utils from '../utils'

@Sendable
class RetryState {
  public attempts_: number = 0
  public lock_: ArkTSUtils.locks.AsyncLock

  constructor(lock_: ArkTSUtils.locks.AsyncLock) {
    this.lock_ = lock_
  }

  async recordAttempt(): Promise<number> {
    return await this.lock_.lockAsync((): number => {
      this.attempts_++
      return this.attempts_
    })
  }

  getAttempts(): number {
    return this.attempts_
  }
}

@Concurrent
function alwaysFailTask(): number {
  throw new Error('real failure from concurrent task')
}

@Concurrent
async function failTwiceThenSucceedTask(state: RetryState): Promise<number> {
  const attempt: number = await state.recordAttempt()
  if (attempt <= 2) {
    throw new Error(`attempt ${attempt} failed`)
  }
  return attempt
}

@Concurrent
async function longRunningTask(state: RetryState): Promise<number> {
  await Utils.sleep(3000)
  return state.getAttempts()
}

@Concurrent
function quickSuccessTask(): number {
   return 2026
}

export default function RealErrorPathTest(): void {
  describe('RealErrorPathTest', (): void => {
    /**
     * @tc.name   testRealErrorPath0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REAL_ERROR_PATH_TEST_0100
     * @tc.desc   Verify error thrown inside concurrent task rejects the execute promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRealErrorPath0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      const task: taskpool.Task = new taskpool.Task(alwaysFailTask)
      let caught: boolean = false
      try {
        await taskpool.execute(task)
        expect().assertFail()
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   testRealErrorPath0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REAL_ERROR_PATH_TEST_0200
     * @tc.desc   Verify application retry logic recovers after two real task failures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRealErrorPath0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const state: RetryState = new RetryState(new ArkTSUtils.locks.AsyncLock())
      let successValue: number = -1
      let failedTimes: number = 0
      for (let round: number = 0; round < 5; round++) {
        const task: taskpool.Task = new taskpool.Task(failTwiceThenSucceedTask, state)
        try {
          const result: Object = await taskpool.execute(task)
          successValue = result as number
          break
        } catch (e) {
          failedTimes++
        }
      }
      expect(failedTimes).assertEqual(2)
      expect(successValue).assertEqual(3)
      expect(state.getAttempts()).assertEqual(3)
      done()
    })

    /**
     * @tc.name   testRealErrorPath0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REAL_ERROR_PATH_TEST_0300
     * @tc.desc   Verify retry stops at max attempts when task keeps failing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRealErrorPath0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      const maxRetries: number = 3
      let attempts: number = 0
      let finalFailed: boolean = false
      for (let round: number = 0; round < maxRetries; round++) {
        const task: taskpool.Task = new taskpool.Task(alwaysFailTask)
        try {
          await taskpool.execute(task)
        } catch (e) {
          attempts++
        }
      }
      if (attempts === maxRetries) {
        finalFailed = true
      }
      expect(attempts).assertEqual(maxRetries)
      expect(finalFailed).assertTrue()
      done()
    })

    /**
     * @tc.name   testRealErrorPath0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REAL_ERROR_PATH_TEST_0400
     * @tc.desc   Verify cancelling a running long task rejects execute and shared state stays unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRealErrorPath0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      try {
        const state: RetryState = new RetryState(new ArkTSUtils.locks.AsyncLock())
        await state.recordAttempt()
        const task: taskpool.Task = new taskpool.Task(longRunningTask, state)
        const executePromise: Promise<Object> = taskpool.execute(task)
        await Utils.sleep(500)
        taskpool.cancel(task)
        let cancelled: boolean = false
        try {
          await executePromise
        } catch (e) {
          cancelled = true
        }
        expect(cancelled).assertTrue()
        expect(state.getAttempts()).assertEqual(1)
      } catch (error) {
        console.error("testRealErrorPath0400 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testRealErrorPath0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_REAL_ERROR_PATH_TEST_0500
     * @tc.desc   Verify real timeout path cancels overdue task while another task still completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRealErrorPath0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      try {
        const state: RetryState = new RetryState(new ArkTSUtils.locks.AsyncLock())
        const overdueTask: taskpool.Task = new taskpool.Task(longRunningTask, state)
        const overduePromise: Promise<Object> = taskpool.execute(overdueTask)
        await Utils.sleep(500)
        taskpool.cancel(overdueTask)
        let overdueFailed: boolean = false
        try {
          await overduePromise
        } catch (e) {
          overdueFailed = true
        }
        expect(overdueFailed).assertTrue()
        const quickTask: taskpool.Task = new taskpool.Task(quickSuccessTask)
        const quickResult: Object = await taskpool.execute(quickTask)
        expect(quickResult as number).assertEqual(2026)
      } catch (error) {
        console.error("testRealErrorPath0500 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
