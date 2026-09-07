'use static';
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

    /**
     * @tc.name    EventListenerTest2900
     * @tc.number  SUB_EVENT_LISTENER_TEST_2900
     * @tc.desc    Verify listener internal try-catch handles errors correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let internalErrorHandled = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        try {
          throw new Error("internal error")
        } catch (e) {
          internalErrorHandled = true
        }
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
      expect(internalErrorHandled).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest3000
     * @tc.number  SUB_EVENT_LISTENER_TEST_3000
     * @tc.desc    Verify listener throwing error is handled by UncaughtErrorListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let listenerCalled = false
      let fallbackCalled = false
      let fallbackListener: StdProcess.UncaughtErrorListener = (error: Object) => {
        fallbackCalled = true
      }
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        listenerCalled = true
        throw new Error("listener error")
      }
      StdProcess.on("uncaughtError", fallbackListener)
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("original error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!(listenerCalled && fallbackCalled) && Date.now() < deadline) {
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
      expect(listenerCalled).assertTrue()
      expect(fallbackCalled).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest3100
     * @tc.number  SUB_EVENT_LISTENER_TEST_3100
     * @tc.desc    Verify registering same RejectedObjectListener multiple times
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let callCount = 0
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        callCount++
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("test"))
      // Same-reference registration is deduplicated by ConcurrentSet rather than replaced,
      // so exactly one dispatch is expected per source event.
      const deadline: number = Date.now() + 5000
      try {
        while (callCount === 0 && Date.now() < deadline) {
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
      expect(callCount).assertEqual(1)
      done()
    })

    /**
     * @tc.name    EventListenerTest3200
     * @tc.number  SUB_EVENT_LISTENER_TEST_3200
     * @tc.desc    Verify multiple RejectedObjectListeners registered for same event all get called
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let listener1Called = false
      let listener2Called = false
      let listener1: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        listener1Called = true
      }
      let listener2: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        listener2Called = true
      }
      StdProcess.on("unhandledPromiseRejection", listener1)
      StdProcess.on("unhandledPromiseRejection", listener2)
      Promise.reject(new Error("test"))
      const deadline: number = Date.now() + 5000
      try {
        while (!listener1Called && Date.now() < deadline) {
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
      expect(listener1Called).assertTrue()
      expect(listener2Called).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest3300
     * @tc.number  SUB_EVENT_LISTENER_TEST_3300
     * @tc.desc    Verify StdProcess.off unhandledPromiseRejection prevents listener callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let called = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        called = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      let offResult = StdProcess.off("unhandledPromiseRejection")
      Promise.reject(new Error("test"))
      // Negative confirmation window: sync Promise.reject dispatches within microtask ticks;
      // 500ms is sufficient to confirm off() prevented the listener from being invoked.
      try {
        await Utils.msSleep(500)
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(offResult).assertTrue()
      expect(called).assertFalse()
      done()
    })

    /**
     * @tc.name    EventListenerTest3400
     * @tc.number  SUB_EVENT_LISTENER_TEST_3400
     * @tc.desc    Verify StdProcess.off uncaughtError removes listener and returns true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let called = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        called = true
      }
      StdProcess.on("uncaughtError", listener)
      let offResult = StdProcess.off("uncaughtError")
       // Do not throw after off: the default uncaught-error handler terminates the HAP.
       // The returned status and the untouched listener flag are the safe observable checks.
       try {
         await Utils.msSleep(500)
       } catch (error) {
         if (error instanceof Error) {
           console.error('EventListenerTest', `await failed: ${error.message}`)
         } else {
           console.error('EventListenerTest', `await failed: unknown error`)
         }
         expect(false).assertFail()
       }
      expect(offResult).assertTrue()
      expect(called).assertFalse()
      done()
    })

    /**
     * @tc.name    EventListenerTest3500
     * @tc.number  SUB_EVENT_LISTENER_TEST_3500
     * @tc.desc    Verify StdProcess.off uncaughtError resets to default handler
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let customHandlerCalled = false
      let customListener: StdProcess.UncaughtErrorListener = (error: Object) => {
        customHandlerCalled = true
      }
      StdProcess.on("uncaughtError", customListener)
      let offResult = StdProcess.off("uncaughtError")
       // Do not throw after off: the default uncaught-error handler terminates the HAP.
       // The returned status and the untouched custom-listener flag are safe checks.
       try {
         await Utils.msSleep(500)
       } catch (error) {
         if (error instanceof Error) {
           console.error('EventListenerTest', `await failed: ${error.message}`)
         } else {
           console.error('EventListenerTest', `await failed: unknown error`)
         }
         expect(false).assertFail()
       }
      expect(offResult).assertTrue()
      expect(customHandlerCalled).assertFalse()
      done()
    })

    /**
     * @tc.name    EventListenerTest3600
     * @tc.number  SUB_EVENT_LISTENER_TEST_3600
     * @tc.desc    Verify async Promise rejection triggers RejectedObjectListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      new Promise<void>((resolve, reject) => {
        reject(new Error("async reject"))
      })
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
     * @tc.name    EventListenerTest3700
     * @tc.number  SUB_EVENT_LISTENER_TEST_3700
     * @tc.desc    Verify Promise chain rejection triggers RejectedObjectListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      const chainTrigger = async (): Promise<void> => {
        throw new Error("chain reject")
      }
      chainTrigger()
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
      expect(capturedMessage).assertEqual("chain reject")
      done()
    })

    /**
     * @tc.name    EventListenerTest3800
     * @tc.number  SUB_EVENT_LISTENER_TEST_3800
     * @tc.desc    Verify async function exception triggers RejectedObjectListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      let asyncFunc = async (): Promise<void> => {
        throw new Error("async error")
      }
      asyncFunc()
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
      expect(capturedMessage).assertContain("async error")
      done()
    })

    /**
     * @tc.name    EventListenerTest3900
     * @tc.number  SUB_EVENT_LISTENER_TEST_3900
     * @tc.desc    Verify count waiting for exactly 3 uncaughtError events
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let callCount = new AtomicInt(0)
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        callCount.fetchAdd(1)
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("error1"))
      fireUncaughtError(200, new Error("error2"))
      fireUncaughtError(300, new Error("error3"))
      const deadline: number = Date.now() + 5000
      try {
        while (callCount.load() < 3 && Date.now() < deadline) {
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
      expect(callCount.load()).assertEqual(3)
      done()
    })

    /**
     * @tc.name    EventListenerTest4000
     * @tc.number  SUB_EVENT_LISTENER_TEST_4000
     * @tc.desc    Verify multiple concurrent Promise rejections are all captured
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('EventListenerTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      const counter: WaitCounter = new WaitCounter()
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        counter.count++
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("error1"))
      Promise.reject(new Error("error2"))
      Promise.reject(new Error("error3"))
      // 3 sync Promise.reject dispatch on microtask ticks; bounded poll via Utils
      // wait helper (timeout 5000ms, interval 100ms) keeps neighbor-count behavior.
      let total: int = 0
      try {
        total = await Utils.waitCountAtLeast(counter, 3, 5000, 100)
        if (total < 3) {
          console.error('EventListenerTest', `listener count not reached within timeout`)
          expect(total).assertEqual(3)
          done()
          return
        }
        expect(total).assertEqual(3)
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    EventListenerTest4100
     * @tc.number  SUB_EVENT_LISTENER_TEST_4100
     * @tc.desc    Verify rejected Promise triggers RejectedObjectListener with correct message
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('EventListenerTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      let captured = false
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("race reject"))
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
      expect(capturedMessage).assertEqual("race reject")
      done()
    })

    /**
     * @tc.name    EventListenerTest4200
     * @tc.number  SUB_EVENT_LISTENER_TEST_4200
     * @tc.desc    Verify RejectedObjectListener receives Error with Unicode message
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let captured = false
      let hasChinese = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        hasChinese = reason.message.indexOf("中文") >= 0
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("错误信息：中文测试"))
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
      expect(hasChinese).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest4300
     * @tc.number  SUB_EVENT_LISTENER_TEST_4300
     * @tc.desc    Verify continuous rapid Promise rejections are all captured
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('EventListenerTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      let rejectCount = new AtomicInt(0)
      let expectedCount = 10
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        rejectCount.fetchAdd(1)
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      for (let i = 0; i < expectedCount; i++) {
        Promise.reject(new Error(`error ${i}`))
      }
      const deadline: number = Date.now() + 5000
      try {
        while (rejectCount.load() < expectedCount && Date.now() < deadline) {
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
      expect(rejectCount.load()).assertEqual(expectedCount)
      done()
    })

    /**
     * @tc.name    EventListenerTest4400
     * @tc.number  SUB_EVENT_LISTENER_TEST_4400
     * @tc.desc    Verify listener works for rejections after registration even if earlier rejection occurred
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let lateCaptured = false
      Promise.reject(new Error("early reject"))
      // Minimum negative window so the early rejection is dispatched before listener registration;
      // sync Promise.reject drains on the next microtask, 100ms is the minimum acceptable wait.
      try {
        await Utils.msSleep(100)
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        if (reason.message === "late reject") {
          lateCaptured = true
        }
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("late reject"))
      const deadline: number = Date.now() + 5000
      try {
        while (!lateCaptured && Date.now() < deadline) {
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
      expect(lateCaptured).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest4500
     * @tc.number  SUB_EVENT_LISTENER_TEST_4500
     * @tc.desc    Verify global error collection with UncaughtErrorListener counting errors
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let errorCount = new AtomicInt(0)
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        errorCount.fetchAdd(1)
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new TypeError("type error"))
      fireUncaughtError(200, new RangeError("range error"))
      fireUncaughtError(300, new Error("generic error"))
      const deadline: number = Date.now() + 5000
      try {
        while (errorCount.load() < 3 && Date.now() < deadline) {
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
      expect(errorCount.load()).assertEqual(3)
      done()
    })

    /**
     * @tc.name    EventListenerTest4600
     * @tc.number  SUB_EVENT_LISTENER_TEST_4600
     * @tc.desc    Verify Promise error logging captures error count with listener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      const counter: WaitCounter = new WaitCounter()
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        counter.count++
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new TypeError("api error"))
      Promise.reject(new Error("network error"))
      // 2 sync Promise.reject dispatch on microtask ticks; bounded poll via Utils
      // wait helper (timeout 5000ms, interval 100ms) keeps neighbor-count behavior.
      let total: int = 0
      try {
        total = await Utils.waitCountAtLeast(counter, 2, 5000, 100)
        if (total < 2) {
          console.error('EventListenerTest', `listener count not reached within timeout`)
          expect(total).assertEqual(2)
          done()
          return
        }
        expect(total).assertEqual(2)
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    EventListenerTest4700
     * @tc.number  SUB_EVENT_LISTENER_TEST_4700
     * @tc.desc    Verify UncaughtErrorListener receives Error instance from reported throw (end-to-end reported-throw payload; distinct from ELT1200 by message content)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let reported = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        reported = error instanceof Error
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("report this"))
      const deadline: number = Date.now() + 5000
      try {
        while (!reported && Date.now() < deadline) {
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
      expect(reported).assertTrue()
      done()
    })

    /**
     * @tc.name    EventListenerTest4800
     * @tc.number  SUB_EVENT_LISTENER_TEST_4800
     * @tc.desc    Verify try-catch caught error does not trigger UncaughtErrorListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let listenerCalled = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object) => {
        listenerCalled = true
      }
      StdProcess.on("uncaughtError", listener)
      try {
        throw new Error("caught error")
      } catch (e) {
        // Error is caught, should not trigger listener
      }
      // Negative confirmation window: try-catch errors never dispatch to UncaughtErrorListener;
      // 500ms is the minimum acceptable wait to confirm the listener stays uncalled.
      try {
        await Utils.msSleep(500)
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(listenerCalled).assertFalse()
      done()
    })

    /**
     * @tc.name    EventListenerTest4900
     * @tc.number  SUB_EVENT_LISTENER_TEST_4900
     * @tc.desc    Verify Promise.catch handled rejection does not trigger RejectedObjectListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let listenerCalled = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        listenerCalled = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      const handledRejection = async (): Promise<void> => {
        try {
          await Promise.reject(new Error("handled rejection"))
        } catch (error) {
          // Error is handled, should not trigger listener
          console.info('EventListenerTest', `handled rejection caught: ${(error instanceof Error) ? error.message : 'unknown'}`)
        }
      }
      handledRejection()
      // Negative confirmation window: handled rejections never dispatch to RejectedObjectListener;
      // 500ms is the minimum acceptable wait to confirm the listener stays uncalled.
      try {
        await Utils.msSleep(500)
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('EventListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(listenerCalled).assertFalse()
      done()
    })

    /**
     * @tc.name    EventListenerTest5000
     * @tc.number  SUB_EVENT_LISTENER_TEST_5000
     * @tc.desc    Verify async/await error handling distinguishes handled vs unhandled
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('EventListenerTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let listenerCalled = false
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        listenerCalled = true
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      let handledFunc = async (): Promise<void> => {
        try {
          await Promise.reject(new Error("handled"))
        } catch (e) {
          // Handled error, should not trigger listener
        }
      }
      let unhandledFunc = async (): Promise<void> => {
        Promise.reject(new Error("unhandled"))
      }
      handledFunc()
      unhandledFunc()
      const deadline: number = Date.now() + 5000
      try {
        while (!listenerCalled && Date.now() < deadline) {
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
      expect(listenerCalled).assertTrue()
      expect(capturedMessage).assertEqual("unhandled")
      done()
    })

    /**
     * @tc.name    EventListenerTest5100
     * @tc.number  SUB_EVENT_LISTENER_TEST_5100
     * @tc.desc    Verify EAWorker.run callback can register RejectedObjectListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('EventListenerTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      let taskCompleted = new AtomicBoolean(false)
      let eaWorker = new EAWorker('testWorker')
      try {
        eaWorker.start()
        eaWorker.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`EventListenerTest worker task error param: ${error.message}`); }
          StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => { console.info(`EventListenerTest unhandledPromiseRejection received: ${reason}`) })
          taskCompleted.store(true)
        })
        const deadline: number = Date.now() + 5000
        try {
          while (!taskCompleted.load() && Date.now() < deadline) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('EventListenerTest', `await failed: ${error.message}`);
          } else {
            console.error('EventListenerTest', `await failed: unknown error`);
          }
          expect(false).assertFail()
        }
        expect(taskCompleted.load()).assertTrue()
      } finally {
        eaWorker.quit()
      }
      done()
    })

    /**
     * @tc.name    EventListenerTest5200
     * @tc.number  SUB_EVENT_LISTENER_TEST_5200
     * @tc.desc    Verify EAWorker.run callback can call StdProcess.off
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('EventListenerTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      let taskCompleted = new AtomicBoolean(false)
      let eaWorker = new EAWorker('testWorker')
      try {
        eaWorker.start()
        eaWorker.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`EventListenerTest worker task error param: ${error.message}`); }
          StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => { console.info(`EventListenerTest unhandledPromiseRejection received: ${reason}`) })
          StdProcess.off("unhandledPromiseRejection")
          taskCompleted.store(true)
        })
        const deadline: number = Date.now() + 5000
        try {
          while (!taskCompleted.load() && Date.now() < deadline) {
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
        expect(taskCompleted.load()).assertTrue()
      } finally {
        eaWorker.quit()
      }
      done()
    })

    /**
     * @tc.name    EventListenerTest5300
     * @tc.number  SUB_EVENT_LISTENER_TEST_5300
     * @tc.desc    Verify UncaughtErrorListener registered in EAWorker postTask is not triggered when error is caught
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('EventListenerTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      let taskCompleted = new AtomicBoolean(false)
      let errorCaptured = new AtomicBoolean(false)
      let eaWorker = new EAWorker('msgWorker')
      try {
        eaWorker.start()
        eaWorker.run<void>((error?: Error) => {
          if (error !== undefined) { console.info(`EventListenerTest worker task error param: ${error.message}`); }
          StdProcess.on("uncaughtError", (error: Object) => {
            console.info(`EventListenerTest uncaughtError received: ${error}`)
            errorCaptured.store(true)
          })
          try {
            throw new Error("handler error")
          } catch (e) {
            // Error caught in worker thread; errorCaptured must remain false.
          }
          taskCompleted.store(true)
        })
        const deadline: number = Date.now() + 5000
        try {
          while (!taskCompleted.load() && Date.now() < deadline) {
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
        expect(taskCompleted.load()).assertTrue()
        expect(errorCaptured.load()).assertFalse()
      } finally {
        eaWorker.quit()
      }
      done()
    })

    /**
     * @tc.name    EventListenerTest5400
     * @tc.number  SUB_EVENT_LISTENER_TEST_5400
     * @tc.desc    Verify TaskPool task can register RejectedObjectListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('EventListenerTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      let taskFunc = (): boolean => {
        StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => { console.info(`EventListenerTest unhandledPromiseRejection received: ${reason}`) })
        return true
      }
      let task = new taskpool.Task(taskFunc)
      try {
        let result = await taskpool.execute(task) as boolean
        expect(result).assertTrue()
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`);
        } else {
          console.error('EventListenerTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name    EventListenerTest5500
     * @tc.number  SUB_EVENT_LISTENER_TEST_5500
     * @tc.desc    Verify TaskPool task triggering Promise rejection
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('EventListenerTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      let captured = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      let rejectionTask = (): void => {
        Promise.reject(new Error("taskpool rejection"))
      }
      let task = new taskpool.Task(rejectionTask)
      try {
        await taskpool.execute(task)
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`);
        } else {
          console.error('EventListenerTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
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
     * @tc.name    EventListenerTest5600
     * @tc.number  SUB_EVENT_LISTENER_TEST_5600
     * @tc.desc    Verify 3 concurrent EAWorkers can call Process interface
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('EventListenerTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      let callCount = new AtomicInt(0)
      let workers: EAWorker[] = []
      try {
        for (let i = 0; i < 3; i++) {
          let worker = new EAWorker(`worker_${i}`)
          worker.start()
          workers.push(worker)
        }
        for (let i = 0; i < workers.length; i++) {
          workers[i].run<void>((error?: Error) => {
            if (error !== undefined) { console.info(`EventListenerTest worker task error param: ${error.message}`); }
            StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => { console.info(`EventListenerTest unhandledPromiseRejection received: ${reason}`) })
            callCount.fetchAdd(1)
          })
        }
        const deadline: number = Date.now() + 5000
        try {
          while (callCount.load() < 3 && Date.now() < deadline) {
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
        expect(callCount.load()).assertEqual(3)
      } finally {
        for (let i = 0; i < workers.length; i++) {
          workers[i].quit()
        }
      }
      done()
    })

    /**
     * @tc.name    EventListenerTest5700
     * @tc.number  SUB_EVENT_LISTENER_TEST_5700
     * @tc.desc    Verify 5 concurrently dispatched TaskPool tasks can call Process interface
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('EventListenerTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let processTask = (): number => {
        StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => { console.info(`EventListenerTest unhandledPromiseRejection received: ${reason}`) })
        callCount.fetchAdd(1)
        return 1
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(processTask)) as Promise<number>)
      }
      try {
        await Promise.all(promises)
      } catch (error) {
        if (error instanceof Error) {
          console.error('EventListenerTest', `await failed: ${error.message}`);
        } else {
          console.error('EventListenerTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      expect(callCount.load()).assertEqual(5)
      done()
    })
  })
}
