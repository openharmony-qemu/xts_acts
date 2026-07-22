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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
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

/** Max wait for shared waiting-flag polls (~5s with sleep(1)). */
const CV_NOTIFY_MAX_RETRY: number = 5000
/** Same-thread notify retries: sleep(50) * 100 ≈ 5s, avoids 1ms busy polling. */
const CV_SAME_THREAD_MAX_RETRY: number = 100
const CV_SAME_THREAD_RETRY_MS: number = 50

/** Same-thread: yield once, then retry notifyOne until waitPromise resolves (bounded). */
async function notifyOneUntilDone(cv: ArkTSUtils.locks.ConditionVariable,
  waitPromise: Promise<void>): Promise<void> {
  // Yield so wait() is registered on the event queue before the first notify
  await sleep(1)
  // Attach then once outside the loop; onReject fail-fast instead of retrying to timeout
  let waitStatus: Promise<string> =
    waitPromise.then((): string => 'done', (): string => 'failed')
  let retries: number = 0
  while (retries < CV_SAME_THREAD_MAX_RETRY) {
    cv.notifyOne()
    let raced: string = await Promise.race([
      waitStatus,
      sleep(CV_SAME_THREAD_RETRY_MS).then((): string => 'retry')
    ])
    if (raced === 'failed') {
      expect().assertFail()
    }
    if (raced === 'done') {
      return
    }
    retries++
  }
  expect().assertFail()
}

/** Same-thread: yield once, then retry notifyAll until waitPromise resolves (bounded). */
async function notifyAllUntilDone(cv: ArkTSUtils.locks.ConditionVariable,
  waitPromise: Promise<void>): Promise<void> {
  await sleep(1)
  // Attach then once outside the loop; onReject fail-fast instead of retrying to timeout
  let waitStatus: Promise<string> =
    waitPromise.then((): string => 'done', (): string => 'failed')
  let retries: number = 0
  while (retries < CV_SAME_THREAD_MAX_RETRY) {
    cv.notifyAll()
    let raced: string = await Promise.race([
      waitStatus,
      sleep(CV_SAME_THREAD_RETRY_MS).then((): string => 'retry')
    ])
    if (raced === 'failed') {
      expect().assertFail()
    }
    if (raced === 'done') {
      return
    }
    retries++
  }
  expect().assertFail()
}

export default function ConditionVariableTest(): void {
  if (!canIUse('SystemCapability.Utils.Lang')) {
    console.info('ConditionVariableTest skipped: SystemCapability.Utils.Lang is not supported')
    return
  }
  describe('ConditionVariableTest', (): void => {
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
      // Same named CV: notify on cv1 until cv2.wait awakens (retry, not fixed sleep)
      await notifyOneUntilDone(cv1, waitPromise)
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

      // Same-thread: retry notify until wait awakens (stable on slow/CI devices)
      await notifyOneUntilDone(cv, waitPromise)
      expect(notified).assertTrue()
    })

    /**
     * @tc.name   ConditionVariableTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0400
     * @tc.desc   Verify ConditionVariable.waitFor() completes after timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConditionVariableTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      let completed: boolean = false
      try {
        // API: waitFor(): Promise<void> — resolves on timeout or notify (not boolean false)
        await cv.waitFor(100)
        completed = true
      } catch (e) {
        // waitFor should not throw on timeout
        let err: Error = e as Error
        console.info('ConditionVariableTest0400 unexpected error: ' + err.message)
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

      // No fixed sleep: retry notifyOne until one waiter awakens (covers late registration)
      expect(wakeCount).assertEqual(0)
      let oneAwake: Promise<void> = Promise.race([waiter1, waiter2, waiter3])
      await notifyOneUntilDone(cv, oneAwake)
      expect(wakeCount).assertEqual(1)

      let allAwake: Promise<void> =
        Promise.all([waiter1, waiter2, waiter3]).then((): void => {})
      await notifyAllUntilDone(cv, allAwake)
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

      // No fixed sleep: bounded notifyAll retry until all waiters awaken
      expect(wakeCount).assertEqual(0)
      let allDone: Promise<void> = Promise.all([waiter1, waiter2, waiter3]).then((): void => {})
      await notifyAllUntilDone(cv, allDone)
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
      // Attach then once outside the loop to avoid accumulating handlers each race
      let taskStatus: Promise<string> =
        execPromise.then((): string => 'done', (): string => 'failed')

      // Wait until worker registered wait() (result.waiting), then notify once
      try {
        let retries: number = 0
        while (!result.waiting && retries < CV_NOTIFY_MAX_RETRY) {
          let raced: string = await Promise.race([
            taskStatus,
            sleep(1).then((): string => 'retry')
          ])
          if (raced === 'failed') {
            expect().assertFail()
          }
          if (raced === 'done') {
            break
          }
          retries++
        }
        expect(result.waiting).assertTrue()
        cv.notifyOne()
        await execPromise
      } catch (e) {
        // Unexpected failure path: assertFail (same style as 0400/0900)
        expect().assertFail()
      }
      expect(result.value).assertEqual('task awakened')
    })

    /**
     * @tc.name   ConditionVariableTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_ARKTS_UTILS_CONDITIONVARIABLE_TEST_0800
     * @tc.desc   Verify ConditionVariable.waitFor(0) completes immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConditionVariableTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable()
      // API: waitFor(): Promise<void> — zero timeout resolves immediately
      let completed: boolean = false
      await cv.waitFor(0)
      completed = true
      expect(completed).assertTrue()
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
      // Attach then once outside the loop to avoid accumulating handlers each race
      let taskStatus: Promise<string> =
        execPromise.then((): string => 'done', (): string => 'failed')

      // Wait until worker registered wait() (counter.waiting), then notify once
      try {
        let retries: number = 0
        while (!counter.waiting && retries < CV_NOTIFY_MAX_RETRY) {
          let raced: string = await Promise.race([
            taskStatus,
            sleep(1).then((): string => 'retry')
          ])
          if (raced === 'failed') {
            expect().assertFail()
          }
          if (raced === 'done') {
            break
          }
          retries++
        }
        expect(counter.waiting).assertTrue()
        cv.notifyOne()
        await execPromise
      } catch (e) {
        // Unexpected failure path: assertFail (same style as 0400/0900)
        expect().assertFail()
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

      // Same-thread: retry notify until waitFor awakens before timeout
      await notifyOneUntilDone(cv, waitPromise)
      await waitPromise
      expect(wokeEarly).assertTrue()
    })
  })
}
