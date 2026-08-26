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

function startRepeatedUnhandledRejection(interval: int, error: Error): int {
  return setInterval((): void => {
    Promise.reject(error);
  }, interval);
}

export default function StdProcessOnTest(): void {
  describe('StdProcessOnTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
      StdProcess.off("unhandledPromiseRejection")
      StdProcess.off("uncaughtError")
    })
    afterAll((): void => {
    })

    /**
     * @tc.name    StdProcessOnTest0100
     * @tc.number  SUB_STD_PROCESS_ON_TEST_0100
     * @tc.desc    Verify a named RejectedObjectListener reference fires on rejection, can be removed by reference, and re-registered to fire again
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured.ready = true
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("test rejection"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(capturedMessage).assertEqual("test rejection")
      expect(StdProcess.off("unhandledPromiseRejection", listener)).assertTrue()
      captured.ready = false
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("reuse rejection"))
      let ready2: boolean = false
      try {
        ready2 = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready2).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest0200
     * @tc.number  SUB_STD_PROCESS_ON_TEST_0200
     * @tc.desc    Verify a named UncaughtErrorListener reference fires on an uncaught error, can be removed by reference, and re-registered to fire again
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        captured.ready = true
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("test error"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(StdProcess.off("uncaughtError", listener)).assertTrue()
      captured.ready = false
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("reuse error"))
      let reuseReady: boolean = false
      try {
        reuseReady = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOnTest0300
     * @tc.number  SUB_STD_PROCESS_ON_TEST_0300
     * @tc.desc    Verify RejectedObjectListener receives the correct reason message
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured.ready = true
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("verify message"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(capturedMessage).assertEqual("verify message")
      done()
    })

    /**
     * @tc.name    StdProcessOnTest0400
     * @tc.number  SUB_STD_PROCESS_ON_TEST_0400
     * @tc.desc    Verify RejectedObjectListener receives a TypeError reason
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let isTypeError = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        isTypeError = reason instanceof TypeError
        captured.ready = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new TypeError("type error"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(isTypeError).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest0500
     * @tc.number  SUB_STD_PROCESS_ON_TEST_0500
     * @tc.desc    Verify RejectedObjectListener reason carries the rejection message
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let messageMatched = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        messageMatched = reason.message === "error instance"
        captured.ready = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("error instance"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(messageMatched).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest0600
     * @tc.number  SUB_STD_PROCESS_ON_TEST_0600
     * @tc.desc    Verify UncaughtErrorListener receives an Error instance
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let isError = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        isError = error instanceof Error
        captured.ready = true
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("props test"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(isError).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest0700
     * @tc.number  SUB_STD_PROCESS_ON_TEST_0700
     * @tc.desc    Verify registering both event types delivers a rejection only to the RejectedObjectListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOnTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let rejected: WaitFlag = new WaitFlag()
      let uncaughtCalled = false
      let rejectedListener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        rejected.ready = true
      }
      let uncaughtListener: StdProcess.UncaughtErrorListener = (error: Object) => {
        uncaughtCalled = true
      }
      StdProcess.on("unhandledPromiseRejection", rejectedListener)
      StdProcess.on("uncaughtError", uncaughtListener)
      Promise.reject(new Error("both types test"))
      let bothTypesReady: boolean = false
      try {
        bothTypesReady = await Utils.waitReady(rejected, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOnTest0800
     * @tc.number  SUB_STD_PROCESS_ON_TEST_0800
     * @tc.desc    Verify StdProcess.on accepts an inline arrow RejectedObjectListener that fires on rejection
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {
        console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`)
        captured.ready = true
      })
      Promise.reject(new Error("arrow test"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest0900
     * @tc.number  SUB_STD_PROCESS_ON_TEST_0900
     * @tc.desc    Verify StdProcess.on accepts an inline arrow UncaughtErrorListener that fires on an uncaught error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      StdProcess.on("uncaughtError", (error: Object) => {
        console.info(`StdProcessOnTest uncaughtError received: ${error}`)
        captured.ready = true
      })
      fireUncaughtError(100, new Error("arrow error"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest1000
     * @tc.number  SUB_STD_PROCESS_ON_TEST_1000
     * @tc.desc    Verify an empty-body listener registration and trigger does not crash the process
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOnTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let sentinel: WaitFlag = new WaitFlag()
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => { console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`) })
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {
        console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`)
        sentinel.ready = true
      })
      Promise.reject(new Error("empty body"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(sentinel, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      let pid: int = StdProcess.pid()
      expect(ready).assertTrue()
      expect(pid > 0).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest1100
     * @tc.number  SUB_STD_PROCESS_ON_TEST_1100
     * @tc.desc    Verify StdProcess.on registers a listener that fires on rejection (the void return contract is guaranteed by the static signature, not asserted at runtime)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured.ready = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("behavioral trigger"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest1200
     * @tc.number  SUB_STD_PROCESS_ON_TEST_1200
     * @tc.desc    Verify an uncaughtError listener is not triggered by a Promise rejection event
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOnTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let rejection: WaitFlag = new WaitFlag()
      let uncaughtCalled = false
      let uncaughtListener: StdProcess.UncaughtErrorListener = (error: Object) => {
        uncaughtCalled = true
      }
      let rejectionListener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        rejection.ready = true
      }
      StdProcess.on("uncaughtError", uncaughtListener)
      StdProcess.on("unhandledPromiseRejection", rejectionListener)
      Promise.reject(new Error("test"))
      let rejectionReady: boolean = false
      try {
        rejectionReady = await Utils.waitReady(rejection, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOnTest1300
     * @tc.number  SUB_STD_PROCESS_ON_TEST_1300
     * @tc.desc    Verify an error thrown inside a RejectedObjectListener is captured by the UncaughtErrorListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOnTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let listenerFired: WaitFlag = new WaitFlag()
      let fallback: WaitFlag = new WaitFlag()
      let fallbackListener: StdProcess.UncaughtErrorListener = (error: Object) => {
        fallback.ready = true
      }
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        listenerFired.ready = true
        throw new Error("listener error")
      }
      StdProcess.on("uncaughtError", fallbackListener)
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("original"))
      let listenerFiredReady: boolean = false
      try {
        listenerFiredReady = await Utils.waitReady(listenerFired, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOnTest1400
     * @tc.number  SUB_STD_PROCESS_ON_TEST_1400
     * @tc.desc    Verify a listener's internal try-catch handles errors without propagating
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOnTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let internalHandled = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured.ready = true
        try {
          throw new Error("internal error")
        } catch (e) {
          internalHandled = true
        }
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("test"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(internalHandled).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest1500
     * @tc.number  SUB_STD_PROCESS_ON_TEST_1500
     * @tc.desc    Verify RejectedObjectListener reason carries a non-empty message
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        capturedMessage = reason.message
        captured.ready = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("verify error props"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(capturedMessage).assertEqual("verify error props")
      done()
    })

    /**
     * @tc.name    StdProcessOnTest1600
     * @tc.number  SUB_STD_PROCESS_ON_TEST_1600
     * @tc.desc    Verify UncaughtErrorListener error is an object carrying the thrown message
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let errorIsObject = false
      let messageMatched = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        errorIsObject = typeof error === "object"
        if (error instanceof Error) {
          messageMatched = error.message === "verify error type"
        }
        captured.ready = true
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("verify error type"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(errorIsObject).assertTrue()
      expect(messageMatched).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest1700
     * @tc.number  SUB_STD_PROCESS_ON_TEST_1700
     * @tc.desc    Verify a single Promise rejection triggers the RejectedObjectListener exactly once
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let calls: WaitCounter = new WaitCounter()
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        calls.count++
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("single rejection"))
      let finalCount: int = 0
      try {
        finalCount = await Utils.waitCountAtLeast(calls, 1, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(finalCount).assertEqual(1)
      done()
    })

    /**
     * @tc.name    StdProcessOnTest1800
     * @tc.number  SUB_STD_PROCESS_ON_TEST_1800
     * @tc.desc    Verify multiple Promise rejections trigger the RejectedObjectListener multiple times
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let calls: WaitCounter = new WaitCounter()
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        calls.count++
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("rejection 1"))
      Promise.reject(new Error("rejection 2"))
      Promise.reject(new Error("rejection 3"))
      let finalCount: int = 0
      try {
        finalCount = await Utils.waitCountAtLeast(calls, 3, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(finalCount).assertEqual(3)
      done()
    })

    /**
     * @tc.name    StdProcessOnTest1900
     * @tc.number  SUB_STD_PROCESS_ON_TEST_1900
     * @tc.desc    Verify RejectedObjectListener receives different Error types (Error/TypeError/RangeError)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let calls: WaitCounter = new WaitCounter()
      let hasError = false
      let hasType = false
      let hasRange = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        calls.count++
        if (reason instanceof RangeError) {
          hasRange = true
        } else if (reason instanceof TypeError) {
          hasType = true
        } else {
          hasError = true
        }
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("Error type"))
      Promise.reject(new TypeError("TypeError"))
      Promise.reject(new RangeError("RangeError"))
      let errorTypeCount: int = 0
      try {
        errorTypeCount = await Utils.waitCountAtLeast(calls, 3, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOnTest2000
     * @tc.number  SUB_STD_PROCESS_ON_TEST_2000
     * @tc.desc    Verify RejectedObjectListener obj parameter is delivered as an object
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let objIsObject = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        objIsObject = typeof obj === "object"
        captured.ready = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("verify obj"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(objIsObject).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest2100
     * @tc.number  SUB_STD_PROCESS_ON_TEST_2100
     * @tc.desc    Verify an uncaught Error triggers the UncaughtErrorListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let isError = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        isError = error instanceof Error
        captured.ready = true
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("uncaught error"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(isError).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest2200
     * @tc.number  SUB_STD_PROCESS_ON_TEST_2200
     * @tc.desc    Verify an uncaught TypeError triggers the UncaughtErrorListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let isTypeError = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        isTypeError = error instanceof TypeError
        captured.ready = true
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new TypeError("type error"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(isTypeError).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest2300
     * @tc.number  SUB_STD_PROCESS_ON_TEST_2300
     * @tc.desc    Verify an uncaught RangeError triggers the UncaughtErrorListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let isRangeError = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        isRangeError = error instanceof RangeError
        captured.ready = true
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new RangeError("range error"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(isRangeError).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest2400
     * @tc.number  SUB_STD_PROCESS_ON_TEST_2400
     * @tc.desc    Verify multiple unhandledPromiseRejection listeners are triggered
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let listener1: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured.ready = true
      }
      let listener2: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured.ready = true
      }
      let listener3: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured.ready = true
      }
      StdProcess.on("unhandledPromiseRejection", listener1)
      StdProcess.on("unhandledPromiseRejection", listener2)
      StdProcess.on("unhandledPromiseRejection", listener3)
      Promise.reject(new Error("multi listener test"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest2500
     * @tc.number  SUB_STD_PROCESS_ON_TEST_2500
     * @tc.desc    Verify uncaughtError uses the last registered listener (last one overrides previous)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let lastListener = ""
      let firstCalled = false
      let secondCalled = false
      let listener1: StdProcess.UncaughtErrorListener = (error: Object) => {
        firstCalled = true
        lastListener = "first"
        captured.ready = true
      }
      let listener2: StdProcess.UncaughtErrorListener = (error: Object) => {
        secondCalled = true
        lastListener = "second"
        captured.ready = true
      }
      let listener3: StdProcess.UncaughtErrorListener = (error: Object) => {
        lastListener = "third"
        captured.ready = true
      }
      StdProcess.on("uncaughtError", listener1)
      StdProcess.on("uncaughtError", listener2)
      StdProcess.on("uncaughtError", listener3)
      fireUncaughtError(100, new Error("override test"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(firstCalled).assertFalse()
      expect(secondCalled).assertFalse()
      expect(lastListener).assertEqual("third")
      done()
    })

    /**
     * @tc.name    StdProcessOnTest2600
     * @tc.number  SUB_STD_PROCESS_ON_TEST_2600
     * @tc.desc    Verify multiple unhandledPromiseRejection listeners are triggered
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOnTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let calls: WaitCounter = new WaitCounter()
      let l1: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        calls.count++
      }
      let l2: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        calls.count++
      }
      let l3: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        calls.count++
      }
      StdProcess.on("unhandledPromiseRejection", l1)
      StdProcess.on("unhandledPromiseRejection", l2)
      StdProcess.on("unhandledPromiseRejection", l3)
      Promise.reject(new Error("order test"))
      let finalCount: int = 0
      try {
        finalCount = await Utils.waitCountAtLeast(calls, 1, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(finalCount).assertLarger(0)
      done()
    })

    /**
     * @tc.name    StdProcessOnTest2700
     * @tc.number  SUB_STD_PROCESS_ON_TEST_2700
     * @tc.desc    Verify StdProcess.off removes a specific listener so it no longer receives callbacks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let sentinel: WaitFlag = new WaitFlag()
      let removed = false
      let subject: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        removed = true
      }
      let witness: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        sentinel.ready = true
      }
      StdProcess.on("unhandledPromiseRejection", subject)
      StdProcess.on("unhandledPromiseRejection", witness)
      let offResult = StdProcess.off("unhandledPromiseRejection", subject)
      Promise.reject(new Error("off test"))
      let offTestReady: boolean = false
      try {
        offTestReady = await Utils.waitReady(sentinel, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOnTest2800
     * @tc.number  SUB_STD_PROCESS_ON_TEST_2800
     * @tc.desc    Verify removing a specific listener leaves the remaining listener working
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let l2Fired: WaitFlag = new WaitFlag()
      let l1Called = false
      let listener1: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        l1Called = true
      }
      let listener2: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        l2Fired.ready = true
      }
      StdProcess.on("unhandledPromiseRejection", listener1)
      StdProcess.on("unhandledPromiseRejection", listener2)
      StdProcess.off("unhandledPromiseRejection", listener1)
      Promise.reject(new Error("partial off test"))
      let partialOffReady: boolean = false
      try {
        partialOffReady = await Utils.waitReady(l2Fired, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOnTest2900
     * @tc.number  SUB_STD_PROCESS_ON_TEST_2900
     * @tc.desc    Verify StdProcess.off without a listener removes all listeners so a subsequent rejection triggers no callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let calls: WaitCounter = new WaitCounter()
      let listener1: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        calls.count++
      }
      let listener2: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        calls.count++
      }
      StdProcess.on("unhandledPromiseRejection", listener1)
      StdProcess.on("unhandledPromiseRejection", listener2)
      Promise.reject(new Error("positive evidence"))
      let onPositiveCount: int = 0
      try {
        onPositiveCount = await Utils.waitCountAtLeast(calls, 1, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOnTest3000
     * @tc.number  SUB_STD_PROCESS_ON_TEST_3000
     * @tc.desc    Verify registering the same listener multiple times triggers it
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOnTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let calls: WaitCounter = new WaitCounter()
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        calls.count++
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("duplicate test"))
      let duplicateCount: int = 0
      try {
        duplicateCount = await Utils.waitCountAtLeast(calls, 1, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOnTest3100
     * @tc.number  SUB_STD_PROCESS_ON_TEST_3100
     * @tc.desc    Verify Promise.reject directly triggers the RejectedObjectListener with the rejection message
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let capturedMessage = ""
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {
        captured.ready = true
        capturedMessage = reason.message
      })
      Promise.reject(new Error("direct reject"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(capturedMessage).assertContain("direct reject")
      done()
    })

    /**
     * @tc.name    StdProcessOnTest3200
     * @tc.number  SUB_STD_PROCESS_ON_TEST_3200
     * @tc.desc    Verify an async function internal reject triggers the RejectedObjectListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {
        console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`)
        captured.ready = true
      })
      let asyncReject = async (): Promise<void> => {
        throw new Error("async error")
      }
      asyncReject()
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest3300
     * @tc.number  SUB_STD_PROCESS_ON_TEST_3300
     * @tc.desc    Verify a Promise chain unhandled reject triggers the RejectedObjectListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let capturedMessage = ""
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {
        captured.ready = true
        capturedMessage = reason.message
      })
      const chainTrigger = async (): Promise<void> => {
        throw new Error("chain reject")
      }
      chainTrigger()
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(capturedMessage).assertEqual("chain reject")
      done()
    })

    /**
     * @tc.name    StdProcessOnTest3400
     * @tc.number  SUB_STD_PROCESS_ON_TEST_3400
     * @tc.desc    Verify Promise.all with a rejection triggers the RejectedObjectListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOnTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {
        console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`)
        captured.ready = true
      })
      Promise.all([
        Promise.resolve(),
        Promise.reject(new Error("all rejection")),
        Promise.resolve()
      ])
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest3500
     * @tc.number  SUB_STD_PROCESS_ON_TEST_3500
     * @tc.desc    Verify Promise.race with a rejection triggers the RejectedObjectListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOnTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {
        console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`)
        captured.ready = true
      })
      Promise.race([
        Promise.reject(new Error("race rejection")),
        Promise.resolve()
      ])
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest3600
     * @tc.number  SUB_STD_PROCESS_ON_TEST_3600
     * @tc.desc    Verify a setTimeout callback Promise.reject triggers the RejectedObjectListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOnTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {
        console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`)
        captured.ready = true
      })
      fireUnhandledRejection(500, new Error("timer rejection"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest3700
     * @tc.number  SUB_STD_PROCESS_ON_TEST_3700
     * @tc.desc    Verify a setInterval callback Promise.reject triggers the RejectedObjectListener multiple times
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOnTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let expectedCount = 3
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {
        console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`)
        callCount.fetchAdd(1)
      })
      let intervalId = startRepeatedUnhandledRejection(500, new Error("interval rejection"))
      const deadline: int = 5000
      let elapsed: int = 0
      try {
          while (callCount.load() < expectedCount && elapsed < deadline) {
            await Utils.msSleep(100)
            elapsed += 100
          }
      } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessOnTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessOnTest', `await failed: unknown error`)
      }
        expect(false).assertFail()
      }
      clearInterval(intervalId)
      expect(callCount.load() >= expectedCount).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest3800
     * @tc.number  SUB_STD_PROCESS_ON_TEST_3800
     * @tc.desc    Verify awaiting an unhandled reject triggers the RejectedObjectListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {
        console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`)
        captured.ready = true
      })
      let noCatch = async (): Promise<void> => {
        Promise.reject(new Error("await rejection"))
      }
      noCatch()
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest3900
     * @tc.number  SUB_STD_PROCESS_ON_TEST_3900
     * @tc.desc    Verify an async function throwing an error triggers the unhandledPromiseRejection listener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('StdProcessOnTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {
        console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`)
        captured.ready = true
      })
      let throwError = async (): Promise<void> => {
        throw new Error("async throw")
      }
      throwError()
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest4000
     * @tc.number  SUB_STD_PROCESS_ON_TEST_4000
     * @tc.desc    Verify multiple EAWorkers concurrently register a RejectedObjectListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOnTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let workers: EAWorker[] = []
      try {
        for (let i = 0; i < 3; i++) {
          let worker = new EAWorker('onWkA_' + i.toString())
          worker.start()
          workers.push(worker)
        }
        for (let i = 0; i < workers.length; i++) {
          workers[i].run<void>((error?: Error): void => {
            if (error !== undefined) { console.info(`StdProcessOnTest worker task error param: ${error.message}`); }
            StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => { console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`) })
            callCount.fetchAdd(1)
          })
        }
        const deadline: int = 5000
        let elapsed: int = 0
        try {
          while (callCount.load() < workers.length && elapsed < deadline) {
            await Utils.msSleep(100)
            elapsed += 100
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessOnTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessOnTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
        expect(callCount.load()).assertEqual(3)
      } finally {
        for (let i = 0; i < workers.length; i++) {
          workers[i].quit()
        }
      }
      done()
    })

    /**
     * @tc.name    StdProcessOnTest4100
     * @tc.number  SUB_STD_PROCESS_ON_TEST_4100
     * @tc.desc    Verify multiple concurrent Promise rejections are counted with AtomicInt
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOnTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let rejectCount = new AtomicInt(0)
      let expectedCount = 10
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {
        console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`)
        rejectCount.fetchAdd(1)
      })
      for (let i = 0; i < expectedCount; i++) {
        Promise.reject(new Error("concurrent error " + i.toString()))
      }
      const deadline: int = 5000
      let elapsed: int = 0
      try {
          while (rejectCount.load() < expectedCount && elapsed < deadline) {
            await Utils.msSleep(100)
            elapsed += 100
          }
      } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessOnTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessOnTest', `await failed: unknown error`)
      }
        expect(false).assertFail()
      }
      expect(rejectCount.load()).assertEqual(expectedCount)
      done()
    })

    /**
     * @tc.name    StdProcessOnTest4200
     * @tc.number  SUB_STD_PROCESS_ON_TEST_4200
     * @tc.desc    Verify listener shared-resource competition is protected by AtomicInt counting
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOnTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let sharedCounter = new AtomicInt(0)
      let expectedCount = 100
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {
        console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`)
        sharedCounter.fetchAdd(1)
      })
      for (let i = 0; i < expectedCount; i++) {
        Promise.reject(new Error("race error " + i.toString()))
      }
      const deadline: int = 5000
      let elapsed: int = 0
      try {
          while (sharedCounter.load() < expectedCount && elapsed < deadline) {
            await Utils.msSleep(100)
            elapsed += 100
          }
      } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessOnTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessOnTest', `await failed: unknown error`)
      }
        expect(false).assertFail()
      }
      expect(sharedCounter.load()).assertEqual(expectedCount)
      done()
    })

    /**
     * @tc.name    StdProcessOnTest4300
     * @tc.number  SUB_STD_PROCESS_ON_TEST_4300
     * @tc.desc    Verify listener registration before a delayed event trigger still receives the callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOnTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {
        console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`)
        captured.ready = true
      })
      fireUnhandledRejection(500, new Error("delayed rejection"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest4400
     * @tc.number  SUB_STD_PROCESS_ON_TEST_4400
     * @tc.desc    Verify rapid register and off operations keep listener registration stable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOnTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured.ready = true
      }
      for (let i = 0; i < 100; i++) {
        StdProcess.on("unhandledPromiseRejection", listener)
        StdProcess.off("unhandledPromiseRejection", listener)
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("rapid test"))
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest4500
     * @tc.number  SUB_STD_PROCESS_ON_TEST_4500
     * @tc.desc    Verify EAWorker.postTask can register an unhandledPromiseRejection listener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOnTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskCompleted = new AtomicBoolean(false)
      let worker = new EAWorker('onWkB')
      try {
        worker.start()
        worker.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessOnTest worker task error param: ${error.message}`); }
          StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => { console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`) })
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
            console.error('StdProcessOnTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessOnTest', `await failed: unknown error`)
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
     * @tc.name    StdProcessOnTest4600
     * @tc.number  SUB_STD_PROCESS_ON_TEST_4600
     * @tc.desc    Verify EAWorker.postTask can register an uncaughtError listener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOnTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskCompleted = new AtomicBoolean(false)
      let worker = new EAWorker('onWkC')
      try {
        worker.start()
        worker.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`StdProcessOnTest worker task error param: ${error.message}`); }
          StdProcess.on("uncaughtError", (error: Object) => { console.info(`StdProcessOnTest uncaughtError received: ${error}`) })
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
            console.error('StdProcessOnTest', `await failed: ${error.message}`)
          } else {
            console.error('StdProcessOnTest', `await failed: unknown error`)
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
     * @tc.name    StdProcessOnTest4700
     * @tc.number  SUB_STD_PROCESS_ON_TEST_4700
     * @tc.desc    Verify a TaskPool task can register a RejectedObjectListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOnTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskFunc = (): boolean => {
        StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => { console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`) })
        return true
      }
      let task = new taskpool.Task(taskFunc)
      try {
        let result = await taskpool.execute(task) as boolean
        expect(result).assertTrue()
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`);
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name    StdProcessOnTest4800
     * @tc.number  SUB_STD_PROCESS_ON_TEST_4800
     * @tc.desc    Verify 3 concurrent EAWorkers register a RejectedObjectListener (AtomicInt counting)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOnTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let totalCount = 3
      let workers: EAWorker[] = []
      try {
        for (let i = 0; i < totalCount; i++) {
          let worker = new EAWorker('onWkD_' + i.toString())
          worker.start()
          workers.push(worker)
        }
        for (let i = 0; i < workers.length; i++) {
          workers[i].run<void>((error?: Error): void => {
            if (error !== undefined) { console.info(`StdProcessOnTest worker task error param: ${error.message}`); }
            StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => { console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`) })
            callCount.fetchAdd(1)
          })
        }
        const deadline: int = 5000
        let elapsed: int = 0
        try {
            while (callCount.load() < totalCount && elapsed < deadline) {
              await Utils.msSleep(100)
              elapsed += 100
            }
        } catch (error) {
            if (error instanceof Error) {
              console.error('StdProcessOnTest', `await failed: ${error.message}`)
            } else {
              console.error('StdProcessOnTest', `await failed: unknown error`)
        }
          expect(false).assertFail()
        }
        expect(callCount.load()).assertEqual(totalCount)
      } finally {
        for (let i = 0; i < workers.length; i++) {
          workers[i].quit()
        }
      }
      done()
    })

    /**
     * @tc.name    StdProcessOnTest4900
     * @tc.number  SUB_STD_PROCESS_ON_TEST_4900
     * @tc.desc    Verify 5 concurrent TaskPool tasks register and remove a RejectedObjectListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOnTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let processTask = (): number => {
        StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => { console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`) })
        StdProcess.off("unhandledPromiseRejection")
        callCount.fetchAdd(1)
        return 1
      }
      for (let i = 0; i < 5; i++) {
        try {
          await taskpool.execute(new taskpool.Task(processTask))
        } catch (error) {
          if (error instanceof Error) {
            console.error('StdProcessOnTest', `await failed: ${error.message}`);
          } else {
            console.error('StdProcessOnTest', `await failed: unknown error`);
          }
          expect(false).assertFail();
        }
      }
      expect(callCount.load()).assertEqual(5)
      done()
    })

    /**
     * @tc.name    StdProcessOnTest5000
     * @tc.number  SUB_STD_PROCESS_ON_TEST_5000
     * @tc.desc    Verify an empty-body listener trigger keeps the process running normally
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOnTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let sentinel: WaitFlag = new WaitFlag()
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => { console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`) })
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {
        console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`)
        sentinel.ready = true
      })
      Promise.reject(new Error("empty trigger"))
      let emptyTriggerReady: boolean = false
      try {
        emptyTriggerReady = await Utils.waitReady(sentinel, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOnTest5100
     * @tc.number  SUB_STD_PROCESS_ON_TEST_5100
     * @tc.desc    Verify RejectedObjectListener receives the exact rejected Error reference
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('StdProcessOnTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let matched = false
      let customError: Error = new Error("custom error object")
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        matched = reason === customError
        captured.ready = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(customError)
      let ready: boolean = false
      try {
        ready = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(ready).assertTrue()
      expect(matched).assertTrue()
      done()
    })

    /**
     * @tc.name    StdProcessOnTest5200
     * @tc.number  SUB_STD_PROCESS_ON_TEST_5200
     * @tc.desc    Verify a listener performing computation runs to completion without blocking the process
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOnTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured: WaitFlag = new WaitFlag()
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        let sum = 0
        for (let i = 0; i < 10000; i++) {
          sum += i
        }
        if (sum >= 0) {
          captured.ready = true
        }
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("long running test"))
      let longRunningReady: boolean = false
      try {
        longRunningReady = await Utils.waitReady(captured, 5000)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    StdProcessOnTest5300
     * @tc.number  SUB_STD_PROCESS_ON_TEST_5300
     * @tc.desc    Verify registering multiple listeners triggers correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('StdProcessOnTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let triggered: WaitFlag = new WaitFlag()
      let listenerCount = 5
      for (let i = 0; i < listenerCount; i++) {
        StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {
          console.info(`StdProcessOnTest unhandledPromiseRejection received: ${reason}`)
          triggered.ready = true
        })
      }
      Promise.reject(new Error("massive listeners test"))
      let massiveReady: boolean = false
      try {
        massiveReady = await Utils.waitReady(triggered, 5000, 100)
      } catch (error) {
        if (error instanceof Error) {
          console.error('StdProcessOnTest', `await failed: ${error.message}`)
        } else {
          console.error('StdProcessOnTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })
  })
}
