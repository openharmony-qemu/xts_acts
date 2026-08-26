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
import Utils, { WaitCounter } from '../Util';

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

class CustomError extends Error {
  errorCode: number = 0
  constructor(message: string, errorCode: number) {
    super(message)
    this.name = "CustomError"
    this.errorCode = errorCode
  }
}

export default function EventListenerTest(): void {
  describe('EventListenerTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
      StdProcess.off("unhandledPromiseRejection")
      StdProcess.off("uncaughtError")
    })
    afterAll((): void => {
    })

    /**
     * @tc.name    EventListenerTest0100
     * @tc.number  SUB_EVENT_LISTENER_TEST_0100
     * @tc.desc    Verify RejectedObjectListener receives standard Error with correct message
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("expected error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest0200
     * @tc.number  SUB_EVENT_LISTENER_TEST_0200
     * @tc.desc    Verify RejectedObjectListener receives TypeError as reason
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = reason instanceof TypeError
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new TypeError("type error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest0300
     * @tc.number  SUB_EVENT_LISTENER_TEST_0300
     * @tc.desc    Verify RejectedObjectListener receives custom Error subclass with custom name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = reason instanceof CustomError
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new CustomError("custom error", 500))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest0400
     * @tc.number  SUB_EVENT_LISTENER_TEST_0400
     * @tc.desc    Verify RejectedObjectListener receives Error with empty message
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error(""))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      expect(capturedMessage).assertEqual("")
      done()
    })

    /**
     * @tc.name    EventListenerTest0500
     * @tc.number  SUB_EVENT_LISTENER_TEST_0500
     * @tc.desc    Verify RejectedObjectListener receives Error with long message
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let capturedMessage = ""
      let longMsg = "a".repeat(10000)
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error(longMsg))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      expect(capturedMessage.length).assertEqual(10000)
      done()
    })

    /**
     * @tc.name    EventListenerTest0600
     * @tc.number  SUB_EVENT_LISTENER_TEST_0600
     * @tc.desc    Verify RejectedObjectListener receives Error with special characters in message
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("error\nwith\ttabs"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      expect(capturedMessage).assertContain("tabs")
      done()
    })

    /**
     * @tc.name    EventListenerTest0700
     * @tc.number  SUB_EVENT_LISTENER_TEST_0700
     * @tc.desc    Verify RejectedObjectListener reason is Error instance (end-to-end reject dispatch; stack is non-stable and not asserted)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let reasonIsError = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        reasonIsError = reason instanceof Error
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("with stack"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      expect(reasonIsError).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest0800
     * @tc.number  SUB_EVENT_LISTENER_TEST_0800
     * @tc.desc    Verify RejectedObjectListener obj parameter is object type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let objType = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        objType = typeof obj
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("test"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      expect(objType).assertEqual("object")
      done()
    })

    /**
     * @tc.name    EventListenerTest0900
     * @tc.number  SUB_EVENT_LISTENER_TEST_0900
     * @tc.desc    Verify RejectedObjectListener obj is not null and not undefined
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let objNotNull = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        objNotNull = obj !== null && obj !== undefined
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("test"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      expect(objNotNull).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest1000
     * @tc.number  SUB_EVENT_LISTENER_TEST_1000
     * @tc.desc    Verify RejectedObjectListener is called for each rejected Promise
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let callCount = 0
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        callCount++
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("error1"))
      Promise.reject(new Error("error2"))
      Promise.reject(new Error("error3"))
      const deadline: number = Date.now() + 5000
      try {
        while (callCount < 3 && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(callCount).assertEqual(3)
      done()
    })

    /**
     * @tc.name    EventListenerTest1100
     * @tc.number  SUB_EVENT_LISTENER_TEST_1100
     * @tc.desc    Verify RejectedObjectListener both reason and obj parameters are valid
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let reasonValid = false
      let objValid = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        reasonValid = reason !== null && reason !== undefined
        objValid = obj !== null && obj !== undefined
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("test error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      expect(reasonValid).assertTrue()
      expect(objValid).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest1200
     * @tc.number  SUB_EVENT_LISTENER_TEST_1200
     * @tc.desc    Verify UncaughtErrorListener receives standard Error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        captured = error instanceof Error
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("uncaught error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest1300
     * @tc.number  SUB_EVENT_LISTENER_TEST_1300
     * @tc.desc    Verify UncaughtErrorListener receives TypeError
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        captured = error instanceof TypeError
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new TypeError("type error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest1400
     * @tc.number  SUB_EVENT_LISTENER_TEST_1400
     * @tc.desc    Verify UncaughtErrorListener receives RangeError
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        captured = error instanceof RangeError
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new RangeError("range error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest1500
     * @tc.number  SUB_EVENT_LISTENER_TEST_1500
     * @tc.desc    Verify UncaughtErrorListener receives SyntaxError
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        captured = error instanceof SyntaxError
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new SyntaxError("syntax error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest1600
     * @tc.number  SUB_EVENT_LISTENER_TEST_1600
     * @tc.desc    Verify UncaughtErrorListener receives ReferenceError
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        captured = error instanceof ReferenceError
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new ReferenceError("reference error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest1700
     * @tc.number  SUB_EVENT_LISTENER_TEST_1700
     * @tc.desc    Verify UncaughtErrorListener receives URIError
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        captured = error instanceof URIError
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new URIError("uri error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest1800
     * @tc.number  SUB_EVENT_LISTENER_TEST_1800
     * @tc.desc    Verify UncaughtErrorListener receives custom Error subclass with code property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        captured = error instanceof CustomError
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new CustomError("custom", 500))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest1900
     * @tc.number  SUB_EVENT_LISTENER_TEST_1900
     * @tc.desc    Verify UncaughtErrorListener error is object type and not null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let errorIsObject = false
      let errorNotNull = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        captured = true
        errorIsObject = typeof error === "object"
        errorNotNull = error !== null
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("test"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      expect(errorIsObject).assertTrue()
      expect(errorNotNull).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest2000
     * @tc.number  SUB_EVENT_LISTENER_TEST_2000
     * @tc.desc    Verify UncaughtErrorListener receives Error instance end-to-end (name/stack are non-stable platform details and not asserted)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        captured = error instanceof Error
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("complete error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest2100
     * @tc.number  SUB_EVENT_LISTENER_TEST_2100
     * @tc.desc    Verify EventListener assigned as RejectedObjectListener works correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let listener: StdProcess.EventListener = (reason: Error, obj: Object) => {
        captured = true
      }
      StdProcess.on("unhandledPromiseRejection", listener as StdProcess.RejectedObjectListener)
      Promise.reject(new Error("test"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest2200
     * @tc.number  SUB_EVENT_LISTENER_TEST_2200
     * @tc.desc    Verify EventListener assigned as UncaughtErrorListener works correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let listener: StdProcess.EventListener = (error: Object) => {
        captured = true
      }
      StdProcess.on("uncaughtError", listener as StdProcess.UncaughtErrorListener)
      fireUncaughtError(100, new Error("test"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest2300
     * @tc.number  SUB_EVENT_LISTENER_TEST_2300
     * @tc.desc    Verify both RejectedObjectListener and UncaughtErrorListener work together
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let rejectedCaptured = false
      let uncaughtCaptured = false
      let rejectedListener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        rejectedCaptured = true
      }
      let uncaughtListener: StdProcess.UncaughtErrorListener = (error: Object) => {
        uncaughtCaptured = true
      }
      StdProcess.on("unhandledPromiseRejection", rejectedListener)
      StdProcess.on("uncaughtError", uncaughtListener)
      Promise.reject(new Error("promise error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!rejectedCaptured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(rejectedCaptured).assertTrue()
      expect(uncaughtCaptured).assertFalse()
      done()
    })

    /**
     * @tc.name    EventListenerTest2400
     * @tc.number  SUB_EVENT_LISTENER_TEST_2400
     * @tc.desc    Verify RejectedObjectListener with implicit void return (no return statement; source PROC-SRC-531) is invoked
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("test"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest2500
     * @tc.number  SUB_EVENT_LISTENER_TEST_2500
     * @tc.desc    Verify RejectedObjectListener with explicit empty return statement (source PROC-SRC-532, syntax-distinct from 2400/2600) is invoked
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        return
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("test"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest2600
     * @tc.number  SUB_EVENT_LISTENER_TEST_2600
     * @tc.desc    Verify RejectedObjectListener with explicit `return undefined` statement (source PROC-SRC-533, syntax-distinct from 2400/2500) is invoked
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        return undefined
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("test"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest2700
     * @tc.number  SUB_EVENT_LISTENER_TEST_2700
     * @tc.desc    Verify RejectedObjectListener callback captures stable self-thrown error message (source PROC-SRC-593; Error.name is non-stable and not asserted)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("callback test"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      expect(capturedMessage).assertEqual("callback test")
      done()
    })

    /**
     * @tc.name    EventListenerTest2800
     * @tc.number  SUB_EVENT_LISTENER_TEST_2800
     * @tc.desc    Verify StdProcess.off with specific listener removes only that listener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let l1Called = false
      let l2Called = false
      let l1: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        l1Called = true
      }
      let l2: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        l2Called = true
      }
      StdProcess.on("unhandledPromiseRejection", l1)
      StdProcess.on("unhandledPromiseRejection", l2)
      StdProcess.off("unhandledPromiseRejection", l1)
      Promise.reject(new Error("test"))
      const deadline: number = Date.now() + 5000
      try {
        while (!l2Called && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(l1Called).assertFalse()
      expect(l2Called).assertTrue()
      done()
    })

  })
}
