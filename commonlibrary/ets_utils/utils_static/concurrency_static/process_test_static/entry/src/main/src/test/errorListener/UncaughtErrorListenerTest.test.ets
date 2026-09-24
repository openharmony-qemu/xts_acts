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

class CustomError extends Error {
  errorCode: number = 0
  constructor(message: string, errorCode: number) {
    super(message)
    this.name = "CustomError"
    this.errorCode = errorCode
  }
}

export default function UncaughtErrorListenerTest(): void {
  describe('UncaughtErrorListenerTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
      StdProcess.off("uncaughtError")
      StdProcess.off("unhandledPromiseRejection")
    })
    afterAll((): void => {
    })

    /**
     * @tc.name    UncaughtErrorListenerTest0100
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_0100
     * @tc.desc    Verify UncaughtErrorListener registered inside a MessageHandler callback on EAWorker
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('UncaughtErrorListenerTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let callCount = new AtomicInt(0)
      let eaWorker = new EAWorker('msgHandlerUncaughtWorker')
      try {
        eaWorker.start()
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          StdProcess.on("uncaughtError", (error: Object): void => { console.info(`UncaughtErrorListenerTest uncaughtError received: ${error}`) })
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
            console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
          } else {
            console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
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
     * @tc.name    UncaughtErrorListenerTest0200
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_0200
     * @tc.desc    Verify StdProcess.off with uncaughtError returns boolean
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('UncaughtErrorListenerTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {}
      StdProcess.on("uncaughtError", listener)
      let offResult: boolean = StdProcess.off("uncaughtError", listener)
      expect(offResult).assertTrue()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest0300
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_0300
     * @tc.desc    Verify UncaughtErrorListener receives Error object with correct name and message
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('UncaughtErrorListenerTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        caught = error instanceof Error
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("test error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!caught && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest0400
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_0400
     * @tc.desc    Verify UncaughtErrorListener receives TypeError with correct name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('UncaughtErrorListenerTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        caught = error instanceof TypeError
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new TypeError("type error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!caught && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest0500
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_0500
     * @tc.desc    Verify UncaughtErrorListener receives RangeError with correct name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('UncaughtErrorListenerTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
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
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest0600
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_0600
     * @tc.desc    Verify UncaughtErrorListener receives SyntaxError with correct name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('UncaughtErrorListenerTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        caught = error instanceof SyntaxError
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new SyntaxError("syntax error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!caught && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest0700
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_0700
     * @tc.desc    Verify UncaughtErrorListener receives ReferenceError with correct name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('UncaughtErrorListenerTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        caught = error instanceof ReferenceError
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new ReferenceError("reference error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!caught && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest0800
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_0800
     * @tc.desc    Verify UncaughtErrorListener receives Error instance end-to-end (stack is non-stable platform detail and not asserted)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('UncaughtErrorListenerTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        caught = error instanceof Error
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("error with stack"))
      const deadline: number = Date.now() + 5000
      try {
        while (!caught && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest0900
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_0900
     * @tc.desc    Verify UncaughtErrorListener receives Error instance end-to-end (name is non-stable platform detail and not asserted)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('UncaughtErrorListenerTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        caught = error instanceof Error
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("error with name"))
      const deadline: number = Date.now() + 5000
      try {
        while (!caught && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest1000
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_1000
     * @tc.desc    Verify UncaughtErrorListener receives Error whose stable message contains expected text
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('UncaughtErrorListenerTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let capturedMessage: string = ""
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        if (error instanceof Error) {
          caught = true
          capturedMessage = error.message
        }
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("test message"))
      const deadline: number = Date.now() + 5000
      try {
        while (!caught && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(caught).assertTrue()
      expect(capturedMessage).assertContain("test message")
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest1100
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_1100
     * @tc.desc    Verify UncaughtErrorListener receives Error whose stable message is empty string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('UncaughtErrorListenerTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let capturedMessage: string = "<unset>"
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        if (error instanceof Error) {
          caught = true
          capturedMessage = error.message
        }
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error(""))
      const deadline: number = Date.now() + 5000
      try {
        while (!caught && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(caught).assertTrue()
      expect(capturedMessage).assertEqual("")
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest1200
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_1200
     * @tc.desc    Verify UncaughtErrorListener receives Error whose stable message contains expected Unicode characters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('UncaughtErrorListenerTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let capturedMessage: string = ""
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        if (error instanceof Error) {
          caught = true
          capturedMessage = error.message
        }
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("发生错误 error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!caught && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(caught).assertTrue()
      expect(capturedMessage).assertContain("发生错误")
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest1300
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_1300
     * @tc.desc    Verify UncaughtErrorListener error parameter is not null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('UncaughtErrorListenerTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let errorNotNull: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        errorNotNull = error !== null
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("test"))
      const deadline: number = Date.now() + 5000
      try {
        while (!errorNotNull && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(errorNotNull).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest1400
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_1400
     * @tc.desc    Verify uncaughtError single callback mode - last registered listener overrides previous
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('UncaughtErrorListenerTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let firstCalled: boolean = false
      let secondCalled: boolean = false
      StdProcess.on("uncaughtError", (error: Object): void => {
        console.info(`UncaughtErrorListenerTest uncaughtError received: ${error}`)
        firstCalled = true
      })
      StdProcess.on("uncaughtError", (error: Object): void => {
        console.info(`UncaughtErrorListenerTest uncaughtError received: ${error}`)
        secondCalled = true
      })
      fireUncaughtError(100, new Error("override test"))
      const deadline: number = Date.now() + 5000
      try {
        while (!secondCalled && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(firstCalled).assertFalse()
      expect(secondCalled).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest1500
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_1500
     * @tc.desc    Verify StdProcess.off uncaughtError returns true and the previously registered listener no longer receives events
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('UncaughtErrorListenerTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let customHandlerCalled: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        customHandlerCalled = true
      }
      StdProcess.on("uncaughtError", listener)
      let offResult: boolean = StdProcess.off("uncaughtError")
      let freshReady = new WaitFlag()
      let fresh: StdProcess.UncaughtErrorListener = (error: Object): void => {
        freshReady.ready = true
      }
      StdProcess.on("uncaughtError", fresh)
      fireUncaughtError(100, new Error("fresh after off"))
      let freshReadyFlag: boolean = false
      try {
        freshReadyFlag = await Utils.waitReady(freshReady, 5000)
        if (!freshReadyFlag) {
          console.error('UncaughtErrorListenerTest', `fresh listener not triggered within timeout`)
          expect(freshReadyFlag).assertTrue()
          done()
          return
        }
        expect(freshReadyFlag).assertTrue()
        expect(customHandlerCalled).assertFalse()
        expect(offResult).assertTrue()
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest1600
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_1600
     * @tc.desc    Verify UncaughtErrorListener triggered by sync throw in setTimeout
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('UncaughtErrorListenerTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let triggered: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        triggered = error instanceof Error
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("sync error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!triggered && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(triggered).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest1700
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_1700
     * @tc.desc    Verify UncaughtErrorListener triggered by timer throw
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('UncaughtErrorListenerTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let triggered: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        triggered = true
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(500, new Error("timer error"))
      const deadline: number = Date.now() + 5000
      try {
        while (!triggered && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(triggered).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest1800
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_1800
     * @tc.desc    Verify uncaughtError listener is not triggered by Promise rejection
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('UncaughtErrorListenerTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let uncaughtCalled: boolean = false
      let rejectionCalled: boolean = false
      StdProcess.on("uncaughtError", (error: Object): void => {
        console.info(`UncaughtErrorListenerTest uncaughtError received: ${error}`)
        uncaughtCalled = true
      })
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object): void => {
        console.info(`UncaughtErrorListenerTest unhandledPromiseRejection received: ${reason}`)
        rejectionCalled = true
      })
      Promise.reject(new Error("rejection only"))
      const deadline: number = Date.now() + 5000
      try {
        while (!rejectionCalled && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      // uncaughtCalled negative assertion: once rejection listener fired, an uncaughtError
      // would already have been dispatched if it were going to fire; assert immediately.
      expect(uncaughtCalled).assertFalse()
      expect(rejectionCalled).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest1900
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_1900
     * @tc.desc    Verify uncaughtError dispatch works while an unhandledPromiseRejection listener is registered
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('UncaughtErrorListenerTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let uncaughtCalled: boolean = false
      StdProcess.on("uncaughtError", (error: Object): void => {
        console.info(`UncaughtErrorListenerTest uncaughtError received: ${error}`)
        uncaughtCalled = true
      })
      StdProcess.on("unhandledPromiseRejection", (reason: Error, obj: Object): void => { console.info(`UncaughtErrorListenerTest unhandledPromiseRejection received: ${reason}`) })
      fireUncaughtError(100, new Error("sync error for both"))
      const deadline: number = Date.now() + 5000
      try {
        while (!uncaughtCalled && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(uncaughtCalled).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest2000
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_2000
     * @tc.desc    Verify listener internal try-catch handles errors correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('UncaughtErrorListenerTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let internalHandled: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        caught = true
        try {
          throw new Error("inner error")
        } catch (e) {
          internalHandled = true
        }
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("test"))
      const deadline: number = Date.now() + 5000
      try {
        while (!caught && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(caught).assertTrue()
      expect(internalHandled).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest2100
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_2100
     * @tc.desc    Verify arrow function as UncaughtErrorListener works correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('UncaughtErrorListenerTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: boolean = false
      StdProcess.on("uncaughtError", (error: Object): void => {
        console.info(`UncaughtErrorListenerTest uncaughtError received: ${error}`)
        captured = true
      })
      fireUncaughtError(100, new Error("arrow test"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest2200
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_2200
     * @tc.desc    Verify UncaughtErrorListener with type signature (error: Object) => void is invoked when registered
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('UncaughtErrorListenerTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        captured = true
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("typed listener"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest2300
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_2300
     * @tc.desc    Verify UncaughtErrorListener with explicit return works correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('UncaughtErrorListenerTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let handled: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        handled = true
        return
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("return test"))
      const deadline: number = Date.now() + 5000
      try {
        while (!handled && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(handled).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest2400
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_2400
     * @tc.desc    Verify UncaughtErrorListener without return statement works correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('UncaughtErrorListenerTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let handled: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        handled = error instanceof Error
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("no return test"))
      const deadline: number = Date.now() + 5000
      try {
        while (!handled && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(handled).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest2500
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_2500
     * @tc.desc    Verify UncaughtErrorListener error object type is object and not null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('UncaughtErrorListenerTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let isObject: boolean = false
      let notNull: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        isObject = typeof error === "object"
        notNull = error !== null
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("type verify"))
      const deadline: number = Date.now() + 5000
      try {
        while (!isObject && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(isObject).assertTrue()
      expect(notNull).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest2600
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_2600
     * @tc.desc    Verify StdProcess.on registration path for uncaughtError invokes the listener (on() returns void; static void-return assertion is replaced by end-to-end invocation)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('UncaughtErrorListenerTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captured: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        captured = true
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("void return verify"))
      const deadline: number = Date.now() + 5000
      try {
        while (!captured && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(captured).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest2700
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_2700
     * @tc.desc    Verify UncaughtErrorListener in try-catch on() does not throw exception
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('UncaughtErrorListenerTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let hasError: boolean = false
      try {
        let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {}
        StdProcess.on("uncaughtError", listener)
      } catch (e) {
        hasError = true
      }
      expect(hasError).assertFalse()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest2800
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_2800
     * @tc.desc    Verify listener body can access StdProcess APIs like pid() while handling error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('UncaughtErrorListenerTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let listenerCalled: boolean = false
      let pidValid: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        let pid: int = StdProcess.pid()
        pidValid = pid > 0
        listenerCalled = true
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("listener api access"))
      const deadline: number = Date.now() + 5000
      try {
        while (!listenerCalled && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(listenerCalled).assertTrue()
      expect(pidValid).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest2900
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_2900
     * @tc.desc    Verify UncaughtErrorListener receives Error instance end-to-end (name/stack are non-stable platform details and not asserted)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('UncaughtErrorListenerTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        caught = error instanceof Error
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("props verify"))
      const deadline: number = Date.now() + 5000
      try {
        while (!caught && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest3000
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_3000
     * @tc.desc    Verify CustomError with code property is received correctly by listener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('UncaughtErrorListenerTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let capturedErrorCode: number = 0
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        if (error instanceof CustomError) {
          caught = true
          capturedErrorCode = error.errorCode
        }
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new CustomError("custom error", 500))
      const deadline: number = Date.now() + 5000
      try {
        while (!caught && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(caught).assertTrue()
      expect(capturedErrorCode).assertEqual(500)
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest3100
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_3100
     * @tc.desc    Verify UncaughtErrorListener body runs to completion after type-safe instanceof guard on the received error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('UncaughtErrorListenerTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let errorHandled: boolean = false
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        if (error instanceof Error) {
          console.info("error handled safely")
        }
        errorHandled = true
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error("safe access"))
      const deadline: number = Date.now() + 5000
      try {
        while (!errorHandled && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(errorHandled).assertTrue()
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest3200
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_3200
     * @tc.desc    Verify TaskPool task can register UncaughtErrorListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('UncaughtErrorListenerTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskFunc = (): boolean => {
        StdProcess.on("uncaughtError", (error: Object): void => {
          console.info(`UncaughtErrorListenerTest uncaughtError received: ${error}`)
          console.info("taskpool error handler")
        })
        return true
      }
      let task = new taskpool.Task(taskFunc)
      try {
        let result = await taskpool.execute(task) as boolean
        expect(result).assertTrue()
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`);
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`);
        }
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest3300
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_3300
     * @tc.desc    Verify EAWorker.postTask can register UncaughtErrorListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('UncaughtErrorListenerTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let taskCompleted: AtomicBoolean = new AtomicBoolean(false)
      let worker: EAWorker = new EAWorker('uelWkA')
      try {
        worker.start()
        worker.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`UncaughtErrorListenerTest worker task error param: ${error.message}`); }
          StdProcess.on("uncaughtError", (error: Object): void => { console.info(`UncaughtErrorListenerTest uncaughtError received: ${error}`) })
          taskCompleted.store(true)
        })
        const deadline: number = Date.now() + 5000
        try {
          while (!taskCompleted.load() && Date.now() < deadline) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
          } else {
            console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
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
     * @tc.name    UncaughtErrorListenerTest3400
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_3400
     * @tc.desc    Verify 3 EAWorkers concurrently register UncaughtErrorListener
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('UncaughtErrorListenerTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let callCount: AtomicInt = new AtomicInt(0)
      let totalCount: number = 3
      let worker0: EAWorker = new EAWorker('uelWkB_0')
      let worker1: EAWorker = new EAWorker('uelWkB_1')
      let worker2: EAWorker = new EAWorker('uelWkB_2')
      try {
        worker0.start()
        worker1.start()
        worker2.start()
        worker0.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`UncaughtErrorListenerTest worker task error param: ${error.message}`); }
          StdProcess.on("uncaughtError", (error: Object): void => { console.info(`UncaughtErrorListenerTest uncaughtError received: ${error}`) }); callCount.fetchAdd(1)
        })
        worker1.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`UncaughtErrorListenerTest worker task error param: ${error.message}`); }
          StdProcess.on("uncaughtError", (error: Object): void => { console.info(`UncaughtErrorListenerTest uncaughtError received: ${error}`) }); callCount.fetchAdd(1)
        })
        worker2.run<void>((error?: Error): void => {
          if (error !== undefined) { console.info(`UncaughtErrorListenerTest worker task error param: ${error.message}`); }
          StdProcess.on("uncaughtError", (error: Object): void => { console.info(`UncaughtErrorListenerTest uncaughtError received: ${error}`) }); callCount.fetchAdd(1)
        })
        const deadline: number = Date.now() + 5000
        try {
          while (callCount.load() < totalCount && Date.now() < deadline) {
            await Utils.msSleep(100)
          }
        } catch (error) {
          if (error instanceof Error) {
            console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
          } else {
            console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
          }
          expect(false).assertFail()
        }
        expect(callCount.load()).assertEqual(totalCount)
      } finally {
        worker0.quit()
        worker1.quit()
        worker2.quit()
      }
      done()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest3500
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_3500
     * @tc.desc    Verify single StdProcess.on/off round-trip for uncaughtError returns true (timing assertion is disallowed; only the boolean round-trip is observed)
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('UncaughtErrorListenerTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {}
      StdProcess.on("uncaughtError", listener)
      let result = StdProcess.off("uncaughtError")
      expect(result).assertTrue()
    })

    /**
     * @tc.name    UncaughtErrorListenerTest3600
     * @tc.number  SUB_UNCAUGHT_ERROR_LISTENER_TEST_3600
     * @tc.desc    Verify UncaughtErrorListener receives Error with 10000-char message
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('UncaughtErrorListenerTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let capturedMessage: string = ""
      let longMsg: string = "a".repeat(10000)
      let listener: StdProcess.UncaughtErrorListener = (error: Object): void => {
        if (error instanceof Error) {
          caught = true
          capturedMessage = error.message
        }
      }
      StdProcess.on("uncaughtError", listener)
      fireUncaughtError(100, new Error(longMsg))
      const deadline: number = Date.now() + 5000
      try {
        while (!caught && Date.now() < deadline) {
          await Utils.msSleep(100)
        }
      } catch (error) {
        if (error instanceof Error) {
          console.error('UncaughtErrorListenerTest', `await failed: ${error.message}`)
        } else {
          console.error('UncaughtErrorListenerTest', `await failed: unknown error`)
        }
        expect(false).assertFail()
      }
      expect(caught).assertTrue()
      expect(capturedMessage.length).assertEqual(10000)
      done()
    })
  })
}
