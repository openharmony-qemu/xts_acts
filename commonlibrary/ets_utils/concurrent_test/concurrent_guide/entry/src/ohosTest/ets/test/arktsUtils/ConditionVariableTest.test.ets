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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArkTSUtils, taskpool } from '@kit.ArkTS';

@Sendable
class TaskResult {
  value: string = ''
}

@Sendable
class WaitCounter {
  count: number = 0
  done: boolean = false
}

@Concurrent
async function waitInTask(cv: ArkTSUtils.locks.ConditionVariable, result: TaskResult): Promise<void> {
  await cv.wait()
  result.value = 'task awakened'
}

@Concurrent
async function waitAndIncrement(cv: ArkTSUtils.locks.ConditionVariable,
  counter: WaitCounter): Promise<void> {
  await cv.wait()
  counter.count++
  counter.done = true
}

export default function ConditionVariableTest(): void {
  describe('ConditionVariableTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   ConditionVariableTest0100
     * @tc.number SUB_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0100
     * @tc.desc   Verify ConditionVariable constructor creates a valid object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConditionVariableTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      expect(cv instanceof ArkTSUtils.locks.ConditionVariable).assertTrue()
    })

    /**
     * @tc.name   ConditionVariableTest0200
     * @tc.number SUB_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0200
     * @tc.desc   Verify ConditionVariable.request() returns same instance for same name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConditionVariableTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let cv1: ArkTSUtils.locks.ConditionVariable =
        ArkTSUtils.locks.ConditionVariable.request('testCV0200')
      let cv2: ArkTSUtils.locks.ConditionVariable =
        ArkTSUtils.locks.ConditionVariable.request('testCV0200')
      expect(cv1 instanceof ArkTSUtils.locks.ConditionVariable).assertTrue()
      expect(cv2 instanceof ArkTSUtils.locks.ConditionVariable).assertTrue()
      // Verify same named CVs share state: notify on cv1 wakes wait on cv2
      let notified: boolean = false
      let waitPromise: Promise<void> = cv2.wait().then(() => {
        notified = true
      })
      // Use Promise.race to confirm waiter is pending without timer wait
      await Promise.race([waitPromise, Promise.resolve()])
      cv1.notifyOne()
      await waitPromise
      expect(notified).assertTrue()
    })

    /**
     * @tc.name   ConditionVariableTest0300
     * @tc.number SUB_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0300
     * @tc.desc   Verify ConditionVariable.wait() blocks until notifyOne is called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConditionVariableTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      let notified: boolean = false

      let waitPromise: Promise<void> = cv.wait().then(() => {
        notified = true
      })

      // Confirm waiter is pending without timer wait
      await Promise.race([waitPromise, Promise.resolve()])
      expect(notified).assertFalse()

      cv.notifyOne()
      await waitPromise
      expect(notified).assertTrue()
    })

    /**
     * @tc.name   ConditionVariableTest0400
     * @tc.number SUB_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0400
     * @tc.desc   Verify ConditionVariable.waitFor() returns after timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConditionVariableTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      let startTime: number = Date.now()

      await cv.waitFor(1000)

      let elapsed: number = Date.now() - startTime
      expect(elapsed >= 999 && elapsed <= 1001).assertTrue()
    })

    /**
     * @tc.name   ConditionVariableTest0500
     * @tc.number SUB_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0500
     * @tc.desc   Verify notifyOne wakes only one waiting task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConditionVariableTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      let wakeCount: number = 0

      let waiter1: Promise<void> = cv.wait().then(() => { wakeCount++ })
      let waiter2: Promise<void> = cv.wait().then(() => { wakeCount++ })
      let waiter3: Promise<void> = cv.wait().then(() => { wakeCount++ })

      // Confirm waiters are pending without timer wait
      await Promise.race([Promise.all([waiter1, waiter2, waiter3]), Promise.resolve()])
      cv.notifyOne()
      // Wait for one waiter to complete
      await Promise.race([waiter1, waiter2, waiter3])
      expect(wakeCount).assertEqual(1)

      cv.notifyAll()
      await Promise.all([waiter1, waiter2, waiter3])
      expect(wakeCount).assertEqual(3)
    })

    /**
     * @tc.name   ConditionVariableTest0600
     * @tc.number SUB_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0600
     * @tc.desc   Verify notifyAll wakes all waiting tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConditionVariableTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      let wakeCount: number = 0

      let waiter1: Promise<void> = cv.wait().then(() => { wakeCount++ })
      let waiter2: Promise<void> = cv.wait().then(() => { wakeCount++ })
      let waiter3: Promise<void> = cv.wait().then(() => { wakeCount++ })

      // Confirm waiters are pending without timer wait
      await Promise.race([Promise.all([waiter1, waiter2, waiter3]), Promise.resolve()])
      cv.notifyAll()
      await Promise.all([waiter1, waiter2, waiter3])
      expect(wakeCount).assertEqual(3)
    })

    /**
     * @tc.name   ConditionVariableTest0700
     * @tc.number SUB_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0700
     * @tc.desc   Verify ConditionVariable can be passed across TaskPool threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConditionVariableTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      let result: TaskResult = new TaskResult()

      let task: taskpool.Task = new taskpool.Task(waitInTask, cv, result)
      let execPromise: Promise<Object> = taskpool.execute(task)

      // Confirm task is pending without timer wait
      await Promise.race([execPromise, Promise.resolve()])
      cv.notifyOne()
      await execPromise
      expect(result.value).assertEqual('task awakened')
    })

    /**
     * @tc.name   ConditionVariableTest0800
     * @tc.number SUB_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0800
     * @tc.desc   Verify ConditionVariable.waitFor() with zero timeout returns immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConditionVariableTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      let startTime: number = Date.now()

      await cv.waitFor(0)

      let elapsed: number = Date.now() - startTime
      expect(elapsed < 500).assertTrue()
    })

    /**
     * @tc.name   ConditionVariableTest0900
     * @tc.number SUB_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0900
     * @tc.desc   Verify notifyOne/notifyAll with no waiters does not throw exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConditionVariableTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      let noError: boolean = true
      try {
        cv.notifyOne()
        cv.notifyAll()
      } catch (e) {
        noError = false
      }
      expect(noError).assertTrue()
    })

    /**
     * @tc.name   ConditionVariableTest1000
     * @tc.number SUB_ARKTS_UTILS_CONDITIONVARIABLE_TEST_1000
     * @tc.desc   Verify ConditionVariable request with different names returns different instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConditionVariableTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let cv1: ArkTSUtils.locks.ConditionVariable =
        ArkTSUtils.locks.ConditionVariable.request('cvAlpha1000')
      let cv2: ArkTSUtils.locks.ConditionVariable =
        ArkTSUtils.locks.ConditionVariable.request('cvBeta1000')
      expect(cv1 !== cv2).assertTrue()
    })

    /**
     * @tc.name   ConditionVariableTest1100
     * @tc.number SUB_ARKTS_UTILS_CONDITIONVARIABLE_TEST_1100
     * @tc.desc   Verify ConditionVariable cross-task wait/notify with shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConditionVariableTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      let counter: WaitCounter = new WaitCounter()

      let task: taskpool.Task = new taskpool.Task(waitAndIncrement, cv, counter)
      let execPromise: Promise<Object> = taskpool.execute(task)

      // Confirm task is pending without timer wait
      await Promise.race([execPromise, Promise.resolve()])
      cv.notifyOne()
      await execPromise
      expect(counter.done).assertTrue()
      expect(counter.count).assertEqual(1)
    })

    /**
     * @tc.name   ConditionVariableTest1200
     * @tc.number SUB_ARKTS_UTILS_CONDITIONVARIABLE_TEST_1200
     * @tc.desc   Verify ConditionVariable.waitFor() can be woken by notify before timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConditionVariableTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      let wokeEarly: boolean = false
      let startTime: number = Date.now()

      let waitPromise: Promise<void> = cv.waitFor(5000).then(() => {
        wokeEarly = true
      })

      // Confirm waiter is pending without timer wait
      await Promise.race([waitPromise, Promise.resolve()])
      cv.notifyOne()
      await waitPromise

      let elapsed: number = Date.now() - startTime
      expect(wokeEarly).assertTrue()
      expect(elapsed < 5000).assertTrue()
    })
  })
}
