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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArkTSUtils, taskpool } from '@kit.ArkTS';
import { sleep } from '../Utils';

@Sendable
class SuppTaskResult {
  value: string = ''
  waiting: boolean = false
}

@Concurrent
async function suppWaitInTask(cv: ArkTSUtils.locks.ConditionVariable, result: SuppTaskResult): Promise<void> {
  const waitPromise: Promise<void> = cv.wait()
  result.waiting = true
  await waitPromise
  result.value = 'task awakened'
}

/** TaskPool waiting-flag polls: sleep(100) * 50 ≈ 5s, avoid 1ms busy polling. */
const SUPP_NOTIFY_MAX_RETRY: number = 50
const SUPP_NOTIFY_RETRY_MS: number = 100

export default function ConditionVariableSupplementTest(): void {
  if (!canIUse('SystemCapability.Utils.Lang')) {
    console.info('ConditionVariableSupplementTest skipped: SystemCapability.Utils.Lang is not supported')
    return
  }
  describe('ConditionVariableSupplementTest', (): void => {
    /**
     * @tc.name   ConditionVariableSupplementTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONDITIONVARIABLE_SUPPLEMENT_TEST_0100
     * @tc.desc   Verify ConditionVariable.waitFor() completes after timeout; unexpected throw asserts Error then fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConditionVariableSupplementTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      let completed: boolean = false
      try {
        await cv.waitFor(100)
        completed = true
      } catch (err) {
        console.info('ConditionVariableSupplementTest0100 unexpected error: ' + err.message)
        expect(err instanceof Error).assertTrue()
        expect().assertFail()
        return
      }
      expect(completed).assertTrue()
    })

    /**
     * @tc.name   ConditionVariableSupplementTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONDITIONVARIABLE_SUPPLEMENT_TEST_0200
     * @tc.desc   Verify notifyOne/notifyAll with no waiters does not throw; unexpected throw asserts Error then fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConditionVariableSupplementTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      let completed: boolean = false
      try {
        cv.notifyOne()
        cv.notifyAll()
        completed = true
      } catch (err) {
        expect(err instanceof Error).assertTrue()
        expect().assertFail()
        return
      }
      expect(completed).assertTrue()
    })

    /**
     * @tc.name   ConditionVariableSupplementTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONDITIONVARIABLE_SUPPLEMENT_TEST_0300
     * @tc.desc   Verify ConditionVariable cross-task wait/notifyOne; unexpected throw asserts Error then fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConditionVariableSupplementTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      const result: SuppTaskResult = new SuppTaskResult()
      const task: taskpool.Task = new taskpool.Task(suppWaitInTask, cv, result)
      // taskpool.execute returns Promise<Object>
      const execPromise: Promise<Object> = taskpool.execute(task)
      const taskStatus: Promise<string> =
        execPromise.then((): string => 'done', (): string => 'failed')
      try {
        let retries: number = 0
        while (!result.waiting && retries < SUPP_NOTIFY_MAX_RETRY) {
          const raced: string = await Promise.race([
            taskStatus,
            sleep(SUPP_NOTIFY_RETRY_MS).then((): string => 'retry')
          ])
          if (raced === 'failed') {
            expect().assertFail()
            return
          }
          if (raced === 'done') {
            expect().assertFail()
            return
          }
          retries++
        }
        expect(result.waiting).assertTrue()
        // hypium assertTrue does not throw; bail out to avoid hanging on await execPromise
        if (!result.waiting) {
          return
        }
        cv.notifyOne()
        await execPromise
      } catch (err) {
        expect(err instanceof Error).assertTrue()
        expect().assertFail()
        return
      }
      expect(result.value).assertEqual('task awakened')
    })
  })
}
