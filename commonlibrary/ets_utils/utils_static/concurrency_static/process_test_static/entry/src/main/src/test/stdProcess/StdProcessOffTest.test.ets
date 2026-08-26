'use static'
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils, { WaitFlag, WaitCounter } from '../Util';

function fireUncaughtError(delay: int, error: Error): void {
  setTimeout((): void => {
    throw error;
  }, delay);
}

function fireUnhandledRejection(delay: int, error: Error): void {
  setTimeout((): void => {
    Promise.reject(error);
  }, delay);
}

export default function StdProcessOffTest(): void {
  describe('StdProcessOffTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
      StdProcess.off("unhandledPromiseRejection")
      StdProcess.off("uncaughtError")
    })
    afterAll((): void => {
    })

    /**
     * @tc.name    StdProcessOffTest0100
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_0100
     * @tc.desc    Verify StdProcess.off with only type parameter removes all unhandledPromiseRejection listeners and returns true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let l1: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
      let l2: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
      StdProcess.on("unhandledPromiseRejection", l1)
      StdProcess.on("unhandledPromiseRejection", l2)
      let result = StdProcess.off("unhandledPromiseRejection")
      expect(result).assertTrue()
    })

    /**
     * @tc.name    StdProcessOffTest0200
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_0200
     * @tc.desc    Verify StdProcess.off with type and listener parameters removes the specified listener and returns true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
      StdProcess.on("unhandledPromiseRejection", listener)
      let result = StdProcess.off("unhandledPromiseRejection", listener)
      expect(result).assertTrue()
    })

    /**
     * @tc.name    StdProcessOffTest0300
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_0300
     * @tc.desc    Verify off(type) removes all registered listeners so a subsequent rejection triggers no callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let calls: WaitCounter = new WaitCounter()
      let l1: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { calls.count++ }
      let l2: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { calls.count++ }
      StdProcess.on("unhandledPromiseRejection", l1)
      StdProcess.on("unhandledPromiseRejection", l2)
      Promise.reject(new Error("positive evidence"))
      let positiveCount: int = 0
      try {
        positiveCount = await Utils.waitCountAtLeast(calls, 1, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(positiveCount).assertLarger(0)
      StdProcess.off("unhandledPromiseRejection")
      Promise.reject(new Error("after off all"))
      try {
        await Utils.msSleep(500)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(calls.count).assertEqual(positiveCount)
      done()
    })

    /**
     * @tc.name    StdProcessOffTest0400
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_0400
     * @tc.desc    Verify off with an unregistered listener does not affect registered listeners
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let registered: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { captured.ready = true }
      let unregistered: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
      StdProcess.on("unhandledPromiseRejection", registered)
      StdProcess.off("unhandledPromiseRejection", unregistered)
      Promise.reject(new Error("still working"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOffTest0500
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_0500
     * @tc.desc    Verify a listener removed once can be re-registered and still receives callbacks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { captured.ready = true }
      StdProcess.on("unhandledPromiseRejection", listener)
      let result1 = StdProcess.off("unhandledPromiseRejection", listener)
      expect(result1).assertTrue()
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("re-register"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOffTest0600
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_0600
     * @tc.desc    Verify off(type) clears listeners and a fresh registration receives callbacks afterward
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let first: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
      let fresh: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { captured.ready = true }
      StdProcess.on("unhandledPromiseRejection", first)
      StdProcess.off("unhandledPromiseRejection")
      StdProcess.off("unhandledPromiseRejection", first)
      StdProcess.on("unhandledPromiseRejection", fresh)
      Promise.reject(new Error("fresh registration"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOffTest0700
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_0700
     * @tc.desc    Verify StdProcess.off with an arrow function listener reference removes it and returns true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let listener = (reason: Error, obj: Object): void => {}
      StdProcess.on("unhandledPromiseRejection", listener)
      let result = StdProcess.off("unhandledPromiseRejection", listener)
      expect(result).assertTrue()
    })

    /**
     * @tc.name    StdProcessOffTest0800
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_0800
     * @tc.desc    Verify removing one listener leaves the remaining listener working
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let calls: WaitCounter = new WaitCounter()
      let l1: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { calls.count++ }
      let l2: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { calls.count++ }
      StdProcess.on("unhandledPromiseRejection", l1)
      StdProcess.on("unhandledPromiseRejection", l2)
      StdProcess.off("unhandledPromiseRejection", l1)
      Promise.reject(new Error("partial off test"))
      let partialFinalCount: int = 0
      try {
        partialFinalCount = await Utils.waitCountAtLeast(calls, 1, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOffTest0900
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_0900
     * @tc.desc    Verify off(listener) prevents the removed listener from receiving callbacks while a remaining listener still fires
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let sentinel: WaitFlag = new WaitFlag()
      let removed = false
      let subject: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { removed = true }
      let witness: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { sentinel.ready = true }
      StdProcess.on("unhandledPromiseRejection", subject)
      StdProcess.on("unhandledPromiseRejection", witness)
      StdProcess.off("unhandledPromiseRejection", subject)
      Promise.reject(new Error("off verify test"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(sentinel, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(removed).assertFalse()
      done()
    })

    /**
     * @tc.name    StdProcessOffTest1000
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_1000
     * @tc.desc    Verify duplicate registration then a single off(listener) returns true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOffTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
      StdProcess.on("unhandledPromiseRejection", listener)
      StdProcess.on("unhandledPromiseRejection", listener)
      let result = StdProcess.off("unhandledPromiseRejection", listener)
      expect(result).assertTrue()
    })

    /**
     * @tc.name    StdProcessOffTest1100
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_1100
     * @tc.desc    Verify off(type) for uncaughtError returns true after a handler is registered
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let handler: StdProcess.UncaughtErrorListener = (error: Object) => {}
      StdProcess.on("uncaughtError", handler)
      let result = StdProcess.off("uncaughtError")
      expect(result).assertTrue()
    })

    /**
     * @tc.name    StdProcessOffTest1200
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_1200
     * @tc.desc    Verify off(type, listener) for uncaughtError returns true when removing the registered handler
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let handler: StdProcess.UncaughtErrorListener = (error: Object) => {}
      StdProcess.on("uncaughtError", handler)
      let result = StdProcess.off("uncaughtError", handler)
      expect(result).assertTrue()
    })

    /**
     * @tc.name    StdProcessOffTest1300
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_1300
     * @tc.desc    Verify multiple on then off(type) for uncaughtError returns true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let h1: StdProcess.UncaughtErrorListener = (error: Object) => {}
      let h2: StdProcess.UncaughtErrorListener = (error: Object) => {}
      StdProcess.on("uncaughtError", h1)
      StdProcess.on("uncaughtError", h2)
      let result = StdProcess.off("uncaughtError")
      expect(result).assertTrue()
    })

    /**
     * @tc.name    StdProcessOffTest1400
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_1400
     * @tc.desc    Verify each registered listener is removed individually, and a listener can be re-registered afterward
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let l1: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
      let l2: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
      let l3: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { captured.ready = true }
      StdProcess.on("unhandledPromiseRejection", l1)
      StdProcess.on("unhandledPromiseRejection", l2)
      StdProcess.on("unhandledPromiseRejection", l3)
      expect(StdProcess.off("unhandledPromiseRejection", l1)).assertTrue()
      expect(StdProcess.off("unhandledPromiseRejection", l2)).assertTrue()
      expect(StdProcess.off("unhandledPromiseRejection", l3)).assertTrue()
      StdProcess.on("unhandledPromiseRejection", l3)
      Promise.reject(new Error("re-register"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOffTest1500
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_1500
     * @tc.desc    Verify listener removal order is independent of registration order and each off returns true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let l1: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
      let l2: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
      StdProcess.on("unhandledPromiseRejection", l1)
      StdProcess.on("unhandledPromiseRejection", l2)
      expect(StdProcess.off("unhandledPromiseRejection", l2)).assertTrue()
      expect(StdProcess.off("unhandledPromiseRejection", l1)).assertTrue()
    })

    /**
     * @tc.name    StdProcessOffTest1600
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_1600
     * @tc.desc    Verify off on an empty listener list is a safe no-op and a fresh registration still receives callbacks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOffTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      StdProcess.off("unhandledPromiseRejection")
      StdProcess.off("unhandledPromiseRejection")
      let captured: WaitFlag = new WaitFlag()
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { captured.ready = true }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("after empty off"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOffTest1700
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_1700
     * @tc.desc    Verify an on-off-on cycle returns true for each off
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
      StdProcess.on("unhandledPromiseRejection", listener)
      expect(StdProcess.off("unhandledPromiseRejection", listener)).assertTrue()
      StdProcess.on("unhandledPromiseRejection", listener)
      expect(StdProcess.off("unhandledPromiseRejection", listener)).assertTrue()
    })

    /**
     * @tc.name    StdProcessOffTest1800
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_1800
     * @tc.desc    Verify off(listener) returns true for both independently registered event types
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let rejectListener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
      let errorListener: StdProcess.UncaughtErrorListener = (error: Object) => {}
      StdProcess.on("unhandledPromiseRejection", rejectListener)
      StdProcess.on("uncaughtError", errorListener)
      expect(StdProcess.off("unhandledPromiseRejection", rejectListener)).assertTrue()
      expect(StdProcess.off("uncaughtError", errorListener)).assertTrue()
    })

    /**
     * @tc.name    StdProcessOffTest1900
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_1900
     * @tc.desc    Verify off(rejectListener) leaves the uncaughtError listener working and the removed listener silent
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rejectCalled = false
      let errorWitness: WaitFlag = new WaitFlag()
      let rejectListener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { rejectCalled = true }
      let errorListener: StdProcess.UncaughtErrorListener = (error: Object) => { errorWitness.ready = true }
      StdProcess.on("unhandledPromiseRejection", rejectListener)
      StdProcess.on("uncaughtError", errorListener)
      StdProcess.off("unhandledPromiseRejection", rejectListener)
      Promise.reject(new Error("removed listener"))
      fireUncaughtError(100, new Error("witness error"))
      let errorWitnessReady: boolean = false
      try {
        errorWitnessReady = await Utils.waitReady(errorWitness, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOffTest2000
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_2000
     * @tc.desc    Verify a listener off then re-registered receives callbacks again
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { captured.ready = true }
      StdProcess.on("unhandledPromiseRejection", listener)
      StdProcess.off("unhandledPromiseRejection", listener)
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("re-register test"))
      let reRegisterReady: boolean = false
      try {
        reRegisterReady = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOffTest2100
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_2100
     * @tc.desc    Verify full lifecycle: on -> trigger -> off -> the removed listener no longer fires
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let triggered: WaitFlag = new WaitFlag()
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { triggered.ready = true }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("lifecycle test 1"))
      let lifecycleReady: boolean = false
      try {
        lifecycleReady = await Utils.waitReady(triggered, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOffTest2200
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_2200
     * @tc.desc    Verify off(listener) and off(type) return true for both supported event types
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let rejectListener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
      StdProcess.on("unhandledPromiseRejection", rejectListener)
      expect(StdProcess.off("unhandledPromiseRejection", rejectListener)).assertTrue()
      let errorListener: StdProcess.UncaughtErrorListener = (error: Object) => {}
      StdProcess.on("uncaughtError", errorListener)
      expect(StdProcess.off("uncaughtError")).assertTrue()
    })

    /**
     * @tc.name    StdProcessOffTest2300
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_2300
     * @tc.desc    Verify consecutive off calls for the same listener are safe and do not throw
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
      StdProcess.on("unhandledPromiseRejection", listener)
      let hasError = false
      try {
        StdProcess.off("unhandledPromiseRejection", listener)
        StdProcess.off("unhandledPromiseRejection", listener)
        StdProcess.off("unhandledPromiseRejection", listener)
      } catch (e) {
        hasError = true
      }
      expect(hasError).assertFalse()
    })

    /**
     * @tc.name    StdProcessOffTest2400
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_2400
     * @tc.desc    Verify registering 100 listeners then off(type) returns true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOffTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 100; i++) {
        let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
        StdProcess.on("unhandledPromiseRejection", listener)
      }
      let result = StdProcess.off("unhandledPromiseRejection")
      expect(result).assertTrue()
    })

    /**
     * @tc.name    StdProcessOffTest2500
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_2500
     * @tc.desc    Verify off(listener) returns true and the removed listener does not fire while a remaining listener still does
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('StdProcessOffTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let sentinel: WaitFlag = new WaitFlag()
      let removed = false
      let subject: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { removed = true }
      let witness: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { sentinel.ready = true }
      StdProcess.on("unhandledPromiseRejection", subject)
      StdProcess.on("unhandledPromiseRejection", witness)
      let offResult = StdProcess.off("unhandledPromiseRejection", subject)
      Promise.reject(new Error("removal verify"))
      let removalVerifyReady: boolean = false
      try {
        removalVerifyReady = await Utils.waitReady(sentinel, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOffTest2600
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_2600
     * @tc.desc    Verify off(type) removes many listeners and allows a fresh registration to receive callbacks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL3
     */
    it('StdProcessOffTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      for (let i = 0; i < 1000; i++) {
        let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
        StdProcess.on("unhandledPromiseRejection", listener)
      }
      let result = StdProcess.off("unhandledPromiseRejection")
      expect(result).assertTrue()
      let captured: WaitFlag = new WaitFlag()
      let fresh: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { captured.ready = true }
      StdProcess.on("unhandledPromiseRejection", fresh)
      Promise.reject(new Error("fresh after bulk off"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOffTest2700
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_2700
     * @tc.desc    Verify EAWorker.run callback can call StdProcess.off for unhandledPromiseRejection
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOffTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => { console.info(`StdProcessOffTest unhandledPromiseRejection received: ${reason}`) })
      let worker = new EAWorker('offWkA')
      try {
        worker.start()
        let job = worker.run<boolean>((error?: Error): boolean => {
          if (error !== undefined) { console.info(`StdProcessOffTest worker task error param: ${error.message}`); }
          return StdProcess.off("unhandledPromiseRejection")
        })
        let offResult: boolean = job.Await()
        await Utils.msSleep(100)
        expect(offResult).assertTrue()
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`);
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`);
        }
        expect(false).assertFail()
      } finally {
        worker.quit()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOffTest2800
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_2800
     * @tc.desc    Verify EAWorker.run callback can call StdProcess.off with the listener parameter
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOffTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
      StdProcess.on("unhandledPromiseRejection", listener)
      let worker = new EAWorker('offWkB')
      try {
        worker.start()
        let job = worker.run<boolean>((error?: Error): boolean => {
          if (error !== undefined) { console.info(`StdProcessOffTest worker task error param: ${error.message}`); }
          return StdProcess.off("unhandledPromiseRejection", listener)
        })
        let offResult: boolean = job.Await()
        try {
          await Utils.msSleep(100)
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessOffTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessOffTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
        expect(offResult).assertTrue()
      } finally {
        worker.quit()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOffTest2900
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_2900
     * @tc.desc    Verify EAWorker.postTask can call StdProcess.off for uncaughtError
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOffTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskCompleted = new AtomicBoolean(false)
      StdProcess.on("uncaughtError", (error: Object) => { console.info(`StdProcessOffTest uncaughtError received: ${error}`) })
      let worker = new EAWorker('offWkC')
      try {
        worker.start()
        worker.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessOffTest worker task error param: ${error.message}`); }
          StdProcess.off("uncaughtError")
          taskCompleted.store(true)
        })
        const deadline: int = 5000
        let elapsed: int = 0
        try {
          while (!taskCompleted.load() && elapsed < deadline) {
            await Utils.msSleep(100)
            elapsed += 100
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessOffTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessOffTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
        expect(taskCompleted.load()).assertTrue()
      } finally {
        worker.quit()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOffTest3000
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_3000
     * @tc.desc    Verify a TaskPool task calling StdProcess.off returns true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOffTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => { console.info(`StdProcessOffTest unhandledPromiseRejection received: ${reason}`) })
      let taskFunc = (): boolean => {
        return StdProcess.off("unhandledPromiseRejection")
      }
      let task = new taskpool.Task(taskFunc)
      try {
        let result = await taskpool.execute(task) as boolean
        expect(result).assertTrue()
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`);
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name    StdProcessOffTest3100
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_3100
     * @tc.desc    Verify 3 concurrent EAWorkers calling StdProcess.off all return true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOffTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let successCount = new AtomicInt(0)
      let totalCount: number = 3
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => { console.info(`StdProcessOffTest unhandledPromiseRejection received: ${reason}`) })
      let workers: EAWorker[] = []
      try {
        for (let i = 0; i < totalCount; i++) {
          let worker = new EAWorker('offWkD_' + i.toString())
          worker.start()
          workers.push(worker)
        }
        for (let i = 0; i < workers.length; i++) {
          workers[i].run<void>((error?: Error): void => {
            if (error !== undefined) { console.info(`StdProcessOffTest worker task error param: ${error.message}`); }
            if (StdProcess.off("unhandledPromiseRejection")) {
              successCount.fetchAdd(1)
            }
          })
        }
        const deadline: int = 5000
        let elapsed: int = 0
        try {
          while (successCount.load() < totalCount && elapsed < deadline) {
            await Utils.msSleep(100)
            elapsed += 100
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessOffTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessOffTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
        let allSuccess: boolean = successCount.load() === totalCount
        expect(allSuccess).assertTrue()
      } finally {
        for (let i = 0; i < workers.length; i++) {
          workers[i].quit()
        }
      }
      done()
    })

    /**
     * @tc.name    StdProcessOffTest3200
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_3200
     * @tc.desc    Verify 5 concurrent TaskPool tasks calling StdProcess.off complete successfully
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOffTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => { console.info(`StdProcessOffTest unhandledPromiseRejection received: ${reason}`) })
      let offTask = (): number => {
        StdProcess.off("unhandledPromiseRejection")
        callCount.fetchAdd(1)
        return 1
      }
      for (let i = 0; i < 5; i++) {
        try {
          await taskpool.execute(new taskpool.Task(offTask))
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessOffTest', `await failed: ${error.message}`);
          } else {
            console.error('StdProcessOffTest', `await failed: unknown error`);
          }
          expect(false).assertFail();
        }
      }
      expect(callCount.load()).assertEqual(5)
      done()
    })

    /**
     * @tc.name    StdProcessOffTest3300
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_3300
     * @tc.desc    Verify StdProcess.off does not throw an exception in a try-catch
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOffTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hasError = false
      try {
        StdProcess.off("unhandledPromiseRejection")
      } catch (e) {
        hasError = true
      }
      expect(hasError).assertFalse()
    })

    /**
     * @tc.name    StdProcessOffTest3400
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_3400
     * @tc.desc    Verify StdProcess.off with a listener in a try-catch does not throw
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOffTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hasError = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
      StdProcess.on("unhandledPromiseRejection", listener)
      try {
        StdProcess.off("unhandledPromiseRejection", listener)
      } catch (e) {
        hasError = true
      }
      expect(hasError).assertFalse()
    })

    /**
     * @tc.name    StdProcessOffTest3500
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_3500
     * @tc.desc    Verify off(uncaughtError) resets the handler and a fresh handler receives callbacks afterward
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let handler: StdProcess.UncaughtErrorListener = (error: Object) => {}
      StdProcess.on("uncaughtError", handler)
      let result1 = StdProcess.off("uncaughtError")
      expect(result1).assertTrue()
      let captured: WaitFlag = new WaitFlag()
      let fresh: StdProcess.UncaughtErrorListener = (error: Object) => { captured.ready = true }
      StdProcess.on("uncaughtError", fresh)
      fireUncaughtError(100, new Error("fresh handler"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOffTest3600
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_3600
     * @tc.desc    Verify a removed listener can be replaced by a different listener that receives callbacks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOffTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let capturedMessage = ""
      let listener1: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { capturedMessage = "listener1" }
      let listener2: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        capturedMessage = "listener2"
        captured.ready = true
      }
      StdProcess.on("unhandledPromiseRejection", listener1)
      StdProcess.off("unhandledPromiseRejection", listener1)
      StdProcess.on("unhandledPromiseRejection", listener2)
      Promise.reject(new Error("replace listener test"))
      let replaceReady: boolean = false
      try {
        replaceReady = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOffTest3700
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_3700
     * @tc.desc    Verify off(type) removes all same-reference listeners so a subsequent rejection triggers no callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOffTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let calls: WaitCounter = new WaitCounter()
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { calls.count++ }
      StdProcess.on("unhandledPromiseRejection", listener)
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("positive evidence"))
      let positiveEvidenceCount: int = 0
      try {
        positiveEvidenceCount = await Utils.waitCountAtLeast(calls, 1, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOffTest3800
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_3800
     * @tc.desc    Verify rapid on-off cycles keep the process running normally
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOffTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {}
      for (let i = 0; i < 100; i++) {
        StdProcess.on("unhandledPromiseRejection", listener)
        StdProcess.off("unhandledPromiseRejection", listener)
      }
      let pid: int = StdProcess.pid()
      expect(pid > 0).assertTrue()
    })

    /**
     * @tc.name    StdProcessOffTest3900
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_3900
     * @tc.desc    Verify off(uncaughtError) after multiple on, and a fresh handler receives callbacks after the reset
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOffTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let h1: StdProcess.UncaughtErrorListener = (error: Object) => {}
      let h2: StdProcess.UncaughtErrorListener = (error: Object) => {}
      StdProcess.on("uncaughtError", h1)
      StdProcess.on("uncaughtError", h2)
      StdProcess.off("uncaughtError")
      let captured: WaitFlag = new WaitFlag()
      let fresh: StdProcess.UncaughtErrorListener = (error: Object) => { captured.ready = true }
      StdProcess.on("uncaughtError", fresh)
      fireUncaughtError(100, new Error("fresh after reset"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOffTest4000
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_4000
     * @tc.desc    Verify a listener with an internal try-catch can be removed and off returns true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOffTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        try {
          let x = reason.message
        } catch (e) {
          // internal try-catch
        }
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      let result = StdProcess.off("unhandledPromiseRejection", listener)
      expect(result).assertTrue()
    })

    /**
     * @tc.name    StdProcessOffTest4100
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_4100
     * @tc.desc    Verify off for unhandledPromiseRejection does not affect the uncaughtError listener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let errorCaptured: WaitFlag = new WaitFlag()
      let errorListener: StdProcess.UncaughtErrorListener = (error: Object) => { errorCaptured.ready = true }
      StdProcess.on("uncaughtError", errorListener)
      StdProcess.off("unhandledPromiseRejection")
      fireUncaughtError(100, new Error("independent type test"))
      let errorCapturedReady: boolean = false
      try {
        errorCapturedReady = await Utils.waitReady(errorCaptured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOffTest4200
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_4200
     * @tc.desc    Verify off for uncaughtError does not affect the unhandledPromiseRejection listener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOffTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let rejectCaptured: WaitFlag = new WaitFlag()
      let rejectListener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => { rejectCaptured.ready = true }
      StdProcess.on("unhandledPromiseRejection", rejectListener)
      StdProcess.off("uncaughtError")
      Promise.reject(new Error("reverse independent test"))
      let rejectCapturedReady: boolean = false
      try {
        rejectCapturedReady = await Utils.waitReady(rejectCaptured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOffTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOffTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOffTest4300
     * @tc.number  SUB_STD_PROCESS_OFF_TEST_4300
     * @tc.desc    Verify StdProcess.off called inside a MessageHandler callback on EAWorker
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOffTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let offOk = new AtomicBoolean(false)
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => { console.info(`StdProcessOffTest unhandledPromiseRejection received: ${reason}`) })
      let eaWorker = new EAWorker('offWkMsg')
      try {
        eaWorker.start()
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let result = StdProcess.off("unhandledPromiseRejection")
          offOk.store(result)
          callCount.fetchAdd(1)
        }, eaWorker)
        let msg = new concurrency.Message(messageHandler)
        msg.sendToTarget()
        let deadline: number = Date.now() + 5000
        try {
          while (callCount.load() < 1 && Date.now() < deadline) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessOffTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessOffTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
        let countDone: boolean = callCount.load() === 1
        let offValid: boolean = offOk.load()
        expect(countDone).assertTrue()
        expect(offValid).assertTrue()
      } finally {
        if (eaWorker.isAlive()) {
          eaWorker.quit()
        }
      }
      done()
    })
  })
}
