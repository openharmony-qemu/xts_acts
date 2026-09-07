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
import Utils, { WaitFlag } from '../Util';

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

function createRejectedPromise(delay: int, error: Error): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    setTimeout((): void => {
      reject(error);
    }, delay);
  });
}

function completeFlagAfter(delay: int, flag: AtomicBoolean): void {
  setTimeout((): void => {
    flag.store(true);
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

export default function RejectedObjectListenerTest(): void {
  describe('RejectedObjectListenerTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach(async (): Promise<void> => {
      StdProcess.off("unhandledPromiseRejection")
      StdProcess.off("uncaughtError")
      try {
        await Utils.msSleep(300)
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
    })
    afterAll((): void => {
    })

    /**
     * @tc.name    RejectedObjectListenerTest0100
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_0100
     * @tc.desc    Verify RejectedObjectListener with both required params reason and obj receives correct values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured = false
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("test error"))
      let deadline: number = Date.now()
      try {
        while (!captured && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      expect(capturedMessage).assertEqual("test error")
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest0200
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_0200
     * @tc.desc    Verify RejectedObjectListener with extra optional param still captures rejection
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RejectedObjectListenerTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let captured = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("extra param test"))
      let deadline: number = Date.now()
      try {
        while (!captured && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest0300
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_0300
     * @tc.desc    Verify RejectedObjectListener reason parameter is standard Error with correct message
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("standard error"))
      let deadline: number = Date.now()
      try {
        while (capturedMessage === "" && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(capturedMessage).assertEqual("standard error")
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest0400
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_0400
     * @tc.desc    Verify RejectedObjectListener reason parameter receives custom Error subclass with business code
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturedCode: number = -1
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        // Assert the custom business code carried by the user-defined subclass instead of the
        // runtime-controlled Error.name / Error.stack properties.
        let custom = reason as CustomError
        capturedCode = custom.errorCode
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new CustomError("custom error", 500))
      let deadline: number = Date.now()
      try {
        while (capturedCode < 0 && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(capturedCode).assertEqual(500)
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest0500
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_0500
     * @tc.desc    Verify RejectedObjectListener reason parameter receives TypeError
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let isTypeError = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        isTypeError = reason instanceof TypeError
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new TypeError("type error"))
      let deadline: number = Date.now()
      try {
        while (!isTypeError && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(isTypeError).assertTrue()
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest0600
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_0600
     * @tc.desc    Verify RejectedObjectListener reason parameter receives RangeError
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let isRangeError = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        isRangeError = reason instanceof RangeError
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new RangeError("range error"))
      let deadline: number = Date.now()
      try {
        while (!isRangeError && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(isRangeError).assertTrue()
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest0700
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_0700
     * @tc.desc    Verify RejectedObjectListener reason with empty message string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured = false
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error(""))
      let deadline: number = Date.now()
      try {
        while (!captured && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      expect(capturedMessage).assertEqual("")
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest0800
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_0800
     * @tc.desc    Verify RejectedObjectListener reason with long message string of 10000 characters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RejectedObjectListenerTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let captured = false
      let msgLen = 0
      let longMsg = "a".repeat(10000)
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        msgLen = reason.message.length
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error(longMsg))
      let deadline: number = Date.now()
      try {
        while (!captured && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      expect(msgLen).assertEqual(10000)
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest0900
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_0900
     * @tc.desc    Verify RejectedObjectListener reason message contains Unicode characters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RejectedObjectListenerTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let captured = false
      let hasUnicode = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        hasUnicode = reason.message.indexOf("\u6D4B\u8BD5\u9519\u8BEF") >= 0
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("\u6D4B\u8BD5\u9519\u8BEF\uD83D\uDE00"))
      let deadline: number = Date.now()
      try {
        while (!captured && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      expect(hasUnicode).assertTrue()
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest1000
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_1000
     * @tc.desc    Verify RejectedObjectListener reason message contains special characters and XSS
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RejectedObjectListenerTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("<script>alert(1)</script>"))
      let deadline: number = Date.now()
      try {
        while (capturedMessage === "" && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(capturedMessage).assertContain("<script>")
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest1100
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_1100
     * @tc.desc    Verify RejectedObjectListener captures synchronous reject invoked inside the Promise constructor
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      // Distinct rejection source: synchronous reject() invoked inside the Promise executor.
      new Promise<void>((resolve, reject) => {
        reject(new Error("constructor reject"))
      })
      let deadline: number = Date.now()
      try {
        while (capturedMessage === "" && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(capturedMessage).assertEqual("constructor reject")
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest1200
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_1200
     * @tc.desc    Verify RejectedObjectListener captures rejection caused by an async function throw
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      // Distinct rejection source: an async function that throws becomes an unhandled rejected promise.
      let trigger = async (): Promise<void> => {
        throw new Error("async throw")
      }
      trigger()
      let deadline: number = Date.now()
      try {
        while (capturedMessage === "" && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(capturedMessage).assertEqual("async throw")
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest1300
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_1300
     * @tc.desc    Verify RejectedObjectListener reason.message property matches reject value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("promise rejected"))
      let deadline: number = Date.now()
      try {
        while (capturedMessage === "" && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(capturedMessage).assertEqual("promise rejected")
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest1400
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_1400
     * @tc.desc    Verify RejectedObjectListener obj parameter is not null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured = false
      let objType = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        objType = typeof obj
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("test"))
      let deadline: number = Date.now()
      try {
        while (!captured && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      expect(objType).assertEqual("object")
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest1500
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_1500
     * @tc.desc    Verify RejectedObjectListener triggered once when same Promise rejected multiple times
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RejectedObjectListenerTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let callCount = 0
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        callCount++
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      new Promise<void>((resolve, reject) => {
        reject(new Error("first"))
        reject(new Error("second"))
      })
      let deadline: number = Date.now()
      try {
        while (callCount < 1 && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(callCount).assertEqual(1)
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest1600
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_1600
     * @tc.desc    Verify RejectedObjectListener captures async reject from setTimeout
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RejectedObjectListenerTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let captured = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      createRejectedPromise(100, new Error("async reject"))
      let deadline: number = Date.now()
      try {
        while (!captured && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest1700
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_1700
     * @tc.desc    Verify RejectedObjectListener with no return statement works correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("no return"))
      let deadline: number = Date.now()
      try {
        while (!captured && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest1800
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_1800
     * @tc.desc    Verify RejectedObjectListener with explicit empty return works correctly when rejection originates from a Promise constructor synchronous reject
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RejectedObjectListenerTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let captured = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        return
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      // Strengthened: distinct rejection source - synchronous reject() inside the Promise executor.
      new Promise<void>((resolve, reject) => {
        reject(new Error("explicit return"))
      })
      let deadline: number = Date.now()
      try {
        while (!captured && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest1900
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_1900
     * @tc.desc    Verify RejectedObjectListener type definition requires void return when rejection originates from an async function throw
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      // Strengthened: distinct rejection source - an async function that throws becomes an unhandled rejected promise.
      let trigger = async (): Promise<void> => {
        throw new Error("void type")
      }
      trigger()
      let deadline: number = Date.now()
      try {
        while (!captured && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest2000
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_2000
     * @tc.desc    Verify RejectedObjectListener can throw error and be caught by try-catch
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RejectedObjectListenerTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let captured = false
      let errorCaught = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        try {
          throw new Error("error in listener")
        } catch (e) {
          errorCaught = true
        }
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("original error"))
      let deadline: number = Date.now()
      try {
        while (!captured && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      expect(errorCaught).assertTrue()
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest2100
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_2100
     * @tc.desc    Verify RejectedObjectListener executes its body without an internal error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured = false
      let errorHandled = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        errorHandled = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("trigger listener"))
      let deadline: number = Date.now()
      try {
        while (!captured && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      expect(errorHandled).assertTrue()
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest2200
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_2200
     * @tc.desc    Verify RejectedObjectListener captures direct reject from Promise constructor
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("direct reject"))
      let deadline: number = Date.now()
      try {
        while (capturedMessage === "" && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(capturedMessage).assertEqual("direct reject")
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest2300
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_2300
     * @tc.desc    Verify RejectedObjectListener captures async reject from setTimeout
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      createRejectedPromise(100, new Error("async reject"))
      let deadline: number = Date.now()
      try {
        while (capturedMessage === "" && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(capturedMessage).assertEqual("async reject")
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest2400
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_2400
     * @tc.desc    Verify RejectedObjectListener type definition works as on method parameter
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured = false
      let myListener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
      }
      StdProcess.on("unhandledPromiseRejection", myListener)
      Promise.reject(new Error("type definition"))
      let deadline: number = Date.now()
      try {
        while (!captured && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest2500
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_2500
     * @tc.desc    Verify RejectedObjectListener passed as function argument to on method captures a .then chain throw
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured = false
      let myListener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
      }
      StdProcess.on("unhandledPromiseRejection", myListener)
      // Strengthened: distinct rejection source - an unhandled throw inside a .then chain.
      const chainTrigger = async (): Promise<void> => {
        throw new Error("argument passing")
      }
      chainTrigger()
      let deadline: number = Date.now()
      try {
        while (!captured && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest2600
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_2600
     * @tc.desc    Verify RejectedObjectListener captures unhandled Promise rejection
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured = false
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("unhandled"))
      let deadline: number = Date.now()
      try {
        while (!captured && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      expect(capturedMessage).assertEqual("unhandled")
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest2700
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_2700
     * @tc.desc    Verify RejectedObjectListener not triggered for handled Promise rejection
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured = false
      let witness = new WaitFlag()
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        if (reason.message === "handled") {
          captured = true
        }
      }
      let witnessListener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        witness.ready = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      StdProcess.on("unhandledPromiseRejection", witnessListener)
      const handledRejection = async (): Promise<void> => {
        try {
          await Promise.reject(new Error("handled"))
        } catch (error) {
          // Error is handled, should not trigger listener
          console.info('RejectedObjectListenerTest', `handled rejection caught: ${(error instanceof Error) ? error.message : 'unknown'}`)
        }
      }
      handledRejection()
      Promise.reject(new Error("witness unhandled"))
      let witnessReady: boolean = false
      try {
        witnessReady = await Utils.waitReady(witness, 5000)
        if (!witnessReady) {
          console.error('RejectedObjectListenerTest', `witness listener not triggered within timeout`)
          expect(witnessReady).assertTrue()
          done()
          return
        }
        expect(witnessReady).assertTrue()
        expect(captured).assertFalse()
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest2800
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_2800
     * @tc.desc    Verify on method registers RejectedObjectListener successfully
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("on register"))
      let deadline: number = Date.now()
      try {
        while (!captured && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest2900
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_2900
     * @tc.desc    Verify off method removes RejectedObjectListener and it no longer triggers
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let callCount = 0
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        callCount++
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("first"))
      let deadline: number = Date.now()
      try {
        while (callCount < 1 && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(callCount).assertEqual(1)
      StdProcess.off("unhandledPromiseRejection", listener)
      Promise.reject(new Error("second"))
      // Negative wait: give the runtime a chance to (incorrectly) trigger the removed listener.
      try {
        await Utils.msSleep(500)
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(callCount).assertEqual(1)
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest3000
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_3000
     * @tc.desc    Verify multiple simultaneous Promise rejections all captured by listener with AtomicInt
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RejectedObjectListenerTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let rejectCount = new AtomicInt(0)
      let expectedCount = 10
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        rejectCount.fetchAdd(1)
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      for (let i = 0; i < expectedCount; i++) {
        Promise.reject(new Error(`error ${i}`))
      }
      let deadline: number = Date.now()
      try {
        while (rejectCount.load() < expectedCount && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(rejectCount.load()).assertEqual(expectedCount)
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest3100
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_3100
     * @tc.desc    Verify listener with async operation completes using AtomicBoolean
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RejectedObjectListenerTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let asyncCompleted = new AtomicBoolean(false)
       let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
         completeFlagAfter(100, asyncCompleted)
       }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("async operation"))
      let deadline: number = Date.now()
      try {
        while (!asyncCompleted.load() && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(asyncCompleted.load()).assertTrue()
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest3200
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_3200
     * @tc.desc    Verify RejectedObjectListener captures timeout rejection from Promise.race
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RejectedObjectListenerTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let captured = new AtomicBoolean(false)
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured.store(true)
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      let timeoutPromise = createRejectedPromise(100, new Error("timeout"))
      Promise.race([timeoutPromise])
      let deadline: number = Date.now()
      try {
        while (!captured.load() && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured.load()).assertTrue()
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest3300
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_3300
     * @tc.desc    Verify RejectedObjectListener captures error from Promise chain without catch
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('RejectedObjectListenerTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      const chainTrigger = async (): Promise<void> => {
        throw new Error("chain error")
      }
      chainTrigger()
      let deadline: number = Date.now()
      try {
        while (capturedMessage === "" && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(capturedMessage).assertEqual("chain error")
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest3400
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_3400
     * @tc.desc    Verify listener not triggered after off removal with AtomicInt verification
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        callCount.fetchAdd(1)
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("first"))
      let deadline: number = Date.now()
      try {
        while (callCount.load() < 1 && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(callCount.load()).assertEqual(1)
      StdProcess.off("unhandledPromiseRejection", listener)
      Promise.reject(new Error("second"))
      // Negative wait: give the runtime a chance to (incorrectly) trigger the removed listener.
      try {
        await Utils.msSleep(500)
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(callCount.load()).assertEqual(1)
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest3500
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_3500
     * @tc.desc    Verify another listener executes when one rejection listener throws an error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RejectedObjectListenerTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let listener1Executed = new AtomicBoolean(false)
      let listener2Executed = new AtomicBoolean(false)
      let uncaughtHandled = new AtomicBoolean(false)
      let uncaughtListener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        uncaughtHandled.store(true)
      }
      let listener1: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        listener1Executed.store(true)
        fireUncaughtError(100, new Error("error in listener1"))
      }
      let listener2: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        listener2Executed.store(true)
      }
      StdProcess.on("uncaughtError", uncaughtListener)
      StdProcess.on("unhandledPromiseRejection", listener1)
      StdProcess.on("unhandledPromiseRejection", listener2)
      Promise.reject(new Error("test"))
      let deadline: number = Date.now()
      try {
        while ((!listener1Executed.load() || !listener2Executed.load()) && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      try {
        while (!uncaughtHandled.load() && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      let l1Done: boolean = listener1Executed.load()
      let l2Done: boolean = listener2Executed.load()
      let errorHandled: boolean = uncaughtHandled.load()
      expect(l1Done).assertTrue()
      expect(l2Done).assertTrue()
      expect(errorHandled).assertTrue()
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest3600
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_3600
     * @tc.desc    Verify RejectedObjectListener registered inside EAWorker postTask callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RejectedObjectListenerTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskCompleted = new AtomicBoolean(false)
      let eaWorker = new EAWorker('rejectedObjWorker1')
      try {
        eaWorker.start()
        eaWorker.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`RejectedObjectListenerTest worker task error param: ${error.message}`); }
          StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {})
          taskCompleted.store(true)
        })
        let deadline: number = Date.now()
        while (!taskCompleted.load() && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
        expect(taskCompleted.load()).assertTrue()
      } finally {
        eaWorker.quit()
      }
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest3700
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_3700
     * @tc.desc    Verify Promise rejection inside EAWorker postTask does not crash and task completes
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RejectedObjectListenerTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskCompleted = new AtomicBoolean(false)
      let eaWorker = new EAWorker('rejectedObjWorker2')
      try {
        eaWorker.start()
        eaWorker.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`RejectedObjectListenerTest worker task error param: ${error.message}`); }
          StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {})
          Promise.reject(new Error("worker rejection"))
          taskCompleted.store(true)
        })
        let deadline: number = Date.now()
        while (!taskCompleted.load() && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
        expect(taskCompleted.load()).assertTrue()
      } finally {
        eaWorker.quit()
      }
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest3800
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_3800
     * @tc.desc    Verify EAWorker postTask can call StdProcess.off for unhandledPromiseRejection
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RejectedObjectListenerTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskCompleted = new AtomicBoolean(false)
      let eaWorker = new EAWorker('rejectedObjWorker3')
      try {
        eaWorker.start()
        eaWorker.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`RejectedObjectListenerTest worker task error param: ${error.message}`); }
          StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {})
          StdProcess.off("unhandledPromiseRejection")
          taskCompleted.store(true)
        })
        let deadline: number = Date.now()
        try {
          while (!taskCompleted.load() && (Date.now() - deadline) < 5000) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('RejectedObjectListenerTest', `await failed: ${error.message}`);
          } else {
            console.error('RejectedObjectListenerTest', `await failed: unknown error`);
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
     * @tc.name    RejectedObjectListenerTest3900
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_3900
     * @tc.desc    Verify RejectedObjectListener registered inside TaskPool task function
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RejectedObjectListenerTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskFunc = (): boolean => {
        StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {})
        return true
      }
      let task = new taskpool.Task(taskFunc)
      try {
        let result = await taskpool.execute(task) as boolean
        expect(result).assertTrue()
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`);
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest4000
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_4000
     * @tc.desc    Verify 3 concurrent EAWorker tasks registering RejectedObjectListener complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RejectedObjectListenerTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let totalCount: number = 3
      let workers: EAWorker[] = []
      for (let i = 0; i < totalCount; i++) {
        let worker = new EAWorker(`worker_${i}`)
        worker.start()
        workers.push(worker)
      }
      try {
        for (let i = 0; i < workers.length; i++) {
          workers[i].run<void>((error?: Error) => {
            if (error !== undefined) { console.info(`RejectedObjectListenerTest worker task error param: ${error.message}`); }
            StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {})
            callCount.fetchAdd(1)
          })
        }
        let deadline: number = Date.now()
        try {
          while (callCount.load() < totalCount && (Date.now() - deadline) < 5000) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
          } else {
            console.error('RejectedObjectListenerTest', `await failed: unknown error`)
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
     * @tc.name    RejectedObjectListenerTest4100
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_4100
     * @tc.desc    Verify 5 concurrent TaskPool tasks registering listener all complete
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RejectedObjectListenerTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let totalCount: number = 5
      let processTask = (): number => {
        StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {})
        callCount.fetchAdd(1)
        return 1
      }
      for (let i = 0; i < totalCount; i++) {
        // Assert the taskpool return value in the main thread, not just the side-effect counter.
        try {
          let result = await taskpool.execute(new taskpool.Task(processTask)) as number
          expect(result).assertEqual(1)
        } catch (error) {
          if (error instanceof Error) {
            console.error('RejectedObjectListenerTest', `await failed: ${error.message}`);
          } else {
            console.error('RejectedObjectListenerTest', `await failed: unknown error`);
          }
          expect(false).assertFail();
        }
      }
      expect(callCount.load()).assertEqual(totalCount)
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest4200
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_4200
     * @tc.desc    Verify shared counter protected by AtomicInt in listener callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RejectedObjectListenerTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let sharedCounter = new AtomicInt(0)
      let expectedCount: number = 5
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        sharedCounter.fetchAdd(1)
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      for (let i = 0; i < expectedCount; i++) {
        Promise.reject(new Error(`lock test ${i}`))
      }
      let deadline: number = Date.now()
      try {
        while (sharedCounter.load() < expectedCount && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(sharedCounter.load()).assertEqual(expectedCount)
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest4300
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_4300
     * @tc.desc    Verify EAWorker lifecycle with quit after listener registration
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RejectedObjectListenerTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskCompleted = new AtomicBoolean(false)
      let eaWorker = new EAWorker('lifecycleWorker')
      try {
        eaWorker.start()
        eaWorker.run<void>((error?: Error) => {
          if (error !== undefined) { console.info(`RejectedObjectListenerTest worker task error param: ${error.message}`); }
          StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object) => {})
          taskCompleted.store(true)
        })
        let deadline: number = Date.now()
        try {
          while (!taskCompleted.load() && (Date.now() - deadline) < 5000) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
          } else {
            console.error('RejectedObjectListenerTest', `await failed: unknown error`)
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
     * @tc.name    RejectedObjectListenerTest4400
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_4400
     * @tc.desc    Verify RejectedObjectListener registered inside a MessageHandler callback on EAWorker
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('RejectedObjectListenerTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let eaWorker = new EAWorker('msgHandlerRejectedWorker')
      try {
        eaWorker.start()
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object): void => {})
          callCount.fetchAdd(1)
        }, eaWorker)
        let msg = new concurrency.Message(messageHandler)
        msg.sendToTarget()
        let deadline: number = Date.now()
        try {
          while (callCount.load() < 1 && (Date.now() - deadline) < 5000) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
          } else {
            console.error('RejectedObjectListenerTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
        let finalCount: number = callCount.load()
        expect(finalCount).assertEqual(1)
      } finally {
        if (eaWorker.isAlive()) {
          eaWorker.quit()
        }
      }
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest4500
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_4500
     * @tc.desc    Verify off method in afterEach removes listener to avoid affecting other tests
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured = false
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        captured = true
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("before off"))
      let deadline: number = Date.now()
      try {
        while (!captured && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      let offResult: boolean = StdProcess.off("unhandledPromiseRejection", listener)
      expect(offResult).assertTrue()
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest4600
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_4600
     * @tc.desc    Verify error message assertion uses assertContain for key info
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let capturedMessage = ""
      let listener: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        capturedMessage = reason.message
      }
      StdProcess.on("unhandledPromiseRejection", listener)
      Promise.reject(new Error("rejection occurred"))
      let deadline: number = Date.now()
      try {
        while (capturedMessage === "" && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(capturedMessage).assertContain("rejection")
      done()
    })

    /**
     * @tc.name    RejectedObjectListenerTest4700
     * @tc.number  SUB_REJECTED_OBJECT_LISTENER_TEST_4700
     * @tc.desc    Verify off without listener param removes all unhandledPromiseRejection listeners
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('RejectedObjectListenerTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let callCount1 = 0
      let callCount2 = 0
      let listener1: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        callCount1++
      }
      let listener2: StdProcess.RejectedObjectListener = (reason: Error, obj: Object) => {
        callCount2++
      }
      StdProcess.on("unhandledPromiseRejection", listener1)
      StdProcess.on("unhandledPromiseRejection", listener2)
      Promise.reject(new Error("before off all"))
      let deadline: number = Date.now()
      try {
        while (callCount1 < 1 && (Date.now() - deadline) < 5000) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(callCount1).assertEqual(1)
      expect(callCount2).assertEqual(1)
      StdProcess.off("unhandledPromiseRejection")
      Promise.reject(new Error("after off all"))
      // Negative wait: give the runtime a chance to (incorrectly) trigger the removed listeners.
      try {
        await Utils.msSleep(500)
      } catch (error) {
        if (error instanceof Error) {
          console.error('RejectedObjectListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('RejectedObjectListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(callCount1).assertEqual(1)
      expect(callCount2).assertEqual(1)
      done()
    })
  })
}
