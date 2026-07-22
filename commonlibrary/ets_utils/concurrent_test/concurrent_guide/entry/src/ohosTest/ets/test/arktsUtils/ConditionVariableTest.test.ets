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
import { ArkTSUtils, taskpool } from '@kit.ArkTS';
import { sleep } from '../Utils';

@Sendable
class TaskResult {
  value: string = ''
  waiting: boolean = false
}

@Sendable
class WaitCounter {
  count: number = 0
  done: boolean = false
  waiting: boolean = false
}

@Concurrent
async function waitInTask(cv: ArkTSUtils.locks.ConditionVariable, result: TaskResult): Promise<void> {
  // Register wait first, then publish waiting so host notify cannot be lost
  let waitPromise: Promise<void> = cv.wait()
  result.waiting = true
  await waitPromise
  result.value = 'task awakened'
}

@Concurrent
async function waitAndIncrement(cv: ArkTSUtils.locks.ConditionVariable,
  counter: WaitCounter): Promise<void> {
  let waitPromise: Promise<void> = cv.wait()
  counter.waiting = true
  await waitPromise
  counter.count++
  counter.done = true
}

export default function ConditionVariableTest(): void {
  describe('ConditionVariableTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})

    /**
     * @tc.name   ConditionVariableTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0100
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
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0200
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
      // Same-thread: short sleep so wait() finishes registering (avoid single-microtask coupling)
      await sleep(1)
      expect(notified).assertFalse()
      cv1.notifyOne()
      await waitPromise
      expect(notified).assertTrue()
    })

    /**
     * @tc.name   ConditionVariableTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0300
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

      // Same-thread: short sleep so wait() finishes registering (avoid single-microtask coupling)
      await sleep(1)
      expect(notified).assertFalse()

      cv.notifyOne()
      await waitPromise
      expect(notified).assertTrue()
    })

    /**
     * @tc.name   ConditionVariableTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0400
     * @tc.desc   Verify ConditionVariable.waitFor() resolves (void) after timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConditionVariableTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      let completed: boolean = false
      try {
        // API: waitFor(): Promise<void> — resolves on timeout or notify (not boolean false)
        let result: void = await cv.waitFor(100)
        completed = true
        expect(result === undefined).assertTrue()
      } catch (e) {
        // waitFor should not throw on timeout
        expect().assertFail()
      }
      expect(completed).assertTrue()
    })

    /**
     * @tc.name   ConditionVariableTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0500
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

      // Same-thread: short sleep so waiters finish registering
      await sleep(1)
      expect(wakeCount).assertEqual(0)
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
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0600
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

      // Same-thread: short sleep so waiters finish registering
      await sleep(1)
      expect(wakeCount).assertEqual(0)
      cv.notifyAll()
      await Promise.all([waiter1, waiter2, waiter3])
      expect(wakeCount).assertEqual(3)
    })

    /**
     * @tc.name   ConditionVariableTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0700
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

      // Wait until worker registered wait() (result.waiting), then notify once
      try {
        while (!result.waiting) {
          let raced: string = await Promise.race([
            execPromise.then((): string => 'done', (): string => 'failed'),
            sleep(1).then((): string => 'retry')
          ])
          if (raced === 'failed') {
            await execPromise
          }
          if (raced === 'done') {
            break
          }
        }
        expect(result.waiting).assertTrue()
        cv.notifyOne()
        await execPromise
      } catch (e) {
        if (e instanceof Error) {
          throw e
        }
        throw new Error('ConditionVariableTest0700 task failed')
      }
      expect(result.value).assertEqual('task awakened')
    })

    /**
     * @tc.name   ConditionVariableTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0800
     * @tc.desc   Verify ConditionVariable.waitFor(0) resolves (void) immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConditionVariableTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      // API: waitFor(): Promise<void> — zero timeout resolves immediately with undefined
      let result: void = await cv.waitFor(0)
      expect(result === undefined).assertTrue()
    })

    /**
     * @tc.name   ConditionVariableTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0900
     * @tc.desc   Verify notifyOne/notifyAll with no waiters does not throw exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConditionVariableTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      let completed: boolean = false
      try {
        cv.notifyOne()
        cv.notifyAll()
        completed = true
      } catch (e) {
        expect().assertFail()
      }
      expect(completed).assertTrue()
    })

    /**
     * @tc.name   ConditionVariableTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ARKTS_UTILS_CONDITIONVARIABLE_TEST_1000
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
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ARKTS_UTILS_CONDITIONVARIABLE_TEST_1100
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

      // Wait until worker registered wait() (counter.waiting), then notify once
      try {
        while (!counter.waiting) {
          let raced: string = await Promise.race([
            execPromise.then((): string => 'done', (): string => 'failed'),
            sleep(1).then((): string => 'retry')
          ])
          if (raced === 'failed') {
            await execPromise
          }
          if (raced === 'done') {
            break
          }
        }
        expect(counter.waiting).assertTrue()
        cv.notifyOne()
        await execPromise
      } catch (e) {
        if (e instanceof Error) {
          throw e
        }
        throw new Error('ConditionVariableTest1100 task failed')
      }
      expect(counter.done).assertTrue()
      expect(counter.count).assertEqual(1)
    })

    /**
     * @tc.name   ConditionVariableTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ARKTS_UTILS_CONDITIONVARIABLE_TEST_1200
     * @tc.desc   Verify ConditionVariable.waitFor() can be woken by notify before timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConditionVariableTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      let wokeEarly: boolean = false

      let waitPromise: Promise<void> = cv.waitFor(5000).then(() => {
        wokeEarly = true
      })

      // Same-thread: short sleep so waitFor() finishes registering
      await sleep(1)
      expect(wokeEarly).assertFalse()
      cv.notifyOne()
      let result: void = await waitPromise
      expect(result === undefined).assertTrue()
      expect(wokeEarly).assertTrue()
    })
  })
}
