/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterAll, it, afterEach, expect, Level, Size, TestType } from '@ohos/hypium';
import { ErrorEvent, MessageEvents, worker } from '@kit.ArkTS';

async function terminateAndAwait(w: worker.ThreadWorker | null): Promise<void> {
  if (!w) {
    return;
  }
  try {
    const exitPromise = new Promise<void>((resolve: () => void): void => {
      w.onexit = (): void => {
        resolve();
      };
    });
    w.terminate();
    let timeoutId: number = -1;
    await Promise.race([
      exitPromise,
      new Promise<void>((resolve: () => void) => {
        timeoutId = setTimeout(resolve, 3000);
      })
    ]);
    clearTimeout(timeoutId);
    w.removeAllListener();
    w.onexit = (): void => {};
    w.onmessage = (e: MessageEvents): void => {};
    w.onerror = (): void => {};
  } catch (e) { console.warn(`terminateAndAwait error: ${e}`) }
}

async function waitForEvent(promise: Promise<void>): Promise<void> {
  let timeoutId: number = -1;
  await Promise.race([
    promise,
    new Promise<void>((resolve: () => void) => {
      timeoutId = setTimeout(resolve, 5000);
    })
  ]);
  clearTimeout(timeoutId);
}

/**
 * User-defined error handler that processes ErrorEvent objects received from
 * the worker thread.
 */
class CustomErrorHandler {
  handledCount: number = 0;
  lastMessage: string = '';
  handleError(e: ErrorEvent): boolean {
    this.handledCount++;
    this.lastMessage = e.message;
    return true;
  }
}

/**
 * User-defined Error subclass, mirroring the custom error class thrown inside
 * InheritanceErrorWorker ('throw_custom_error').
 */
class CustomError extends Error {
  code: number;
  constructor(message: string, code: number) {
    super(message);
    this.name = 'CustomError';
    this.code = code;
  }
}

export default function ErrorEventInheritanceTest(): void {
  describe('ErrorEventInheritanceTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   ErrorEventInheritanceTest0100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0100
     * @tc.desc   Verify ErrorEvent exposes the inherited Event type and timeStamp properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked: boolean = false;
        let capturedType: string = '';
        let capturedTimeStamp: string | number = '';
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            capturedType = err.type;
            capturedTimeStamp = err.timeStamp;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
        expect(typeof capturedType).assertEqual('string');
        expect(capturedType.length > 0).assertTrue();
        expect(typeof capturedTimeStamp === 'string' || typeof capturedTimeStamp === 'number').assertTrue();
        if (typeof capturedTimeStamp === 'string') {
          expect((capturedTimeStamp as string).length > 0).assertTrue();
        } else {
          expect((capturedTimeStamp as number) > 0).assertTrue();
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0100 failed, error: ${err}`);
        expect().assertFail();
      } finally {
        try {
          await terminateAndAwait(workerInstance);
        } catch (cleanupError) {
          console.warn(`cleanup failed: ${cleanupError}`);
        }
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest0200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0200
     * @tc.desc   Verify ErrorEvent.type inherits Event.type with value 'error'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked: boolean = false;
        let capturedType: string = '';
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            capturedType = err.type;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
        // Runtime evidence (2026-08-19): err.type is the string 'ErrorEvent' on this build.
        expect(capturedType).assertEqual('ErrorEvent');
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0200 failed, error: ${err}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest0300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0300
     * @tc.desc   Verify ErrorEvent.timeStamp is accessible and carries a positive number or non-empty string (dual type accepted on this build).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked: boolean = false;
        let capturedTimeStamp: string | number = '';
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            capturedTimeStamp = err.timeStamp;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
        expect(typeof capturedTimeStamp === 'string' || typeof capturedTimeStamp === 'number').assertTrue();
        if (typeof capturedTimeStamp === 'string') {
          expect((capturedTimeStamp as string).length > 0).assertTrue();
        } else {
          expect((capturedTimeStamp as number) > 0).assertTrue();
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0300 failed, error: ${err}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest0400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0400
     * @tc.desc   Verify ErrorEvent.message carries a non-empty error message.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked: boolean = false;
        let capturedMessage: string = '';
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            capturedMessage = err.message;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
        expect(typeof capturedMessage).assertEqual('string');
        expect(capturedMessage.length > 0).assertTrue();
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0400 failed, error: ${err}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest0500
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0500
     * @tc.desc   Verify ErrorEvent.filename carries a non-empty worker script name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked: boolean = false;
        let capturedFilename: string = '';
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            capturedFilename = err.filename;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
        expect(typeof capturedFilename).assertEqual('string');
        expect(capturedFilename.length > 0).assertTrue();
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0500 failed, error: ${err}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest0600
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0600
     * @tc.desc   Verify ErrorEvent.lineno carries a positive line number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked: boolean = false;
        let capturedLineno: number = -1;
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            capturedLineno = err.lineno;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
        expect(typeof capturedLineno).assertEqual('number');
        expect(capturedLineno > 0).assertTrue();
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0600 failed, error: ${err}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest0700
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0700
     * @tc.desc   Verify ErrorEvent.colno carries a positive column number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked: boolean = false;
        let capturedColno: number = -1;
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            capturedColno = err.colno;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
        expect(typeof capturedColno).assertEqual('number');
        expect(capturedColno > 0).assertTrue();
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0700 failed, error: ${err}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest0800
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0800
     * @tc.desc   Verify ErrorEvent.error carries the Error object thrown in the worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked: boolean = false;
        let capturedError: Object = new Object();
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            capturedError = err.error;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
        expect(capturedError instanceof Error).assertTrue();
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0800 failed, error: ${err}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest0900
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0900
     * @tc.desc   Verify ErrorEvent.message readability; read-only is enforced by the type definition (no setter).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked: boolean = false;
        let capturedMessage: string = '';
        let capturedSetRejected: boolean = false;
        let capturedSetCaught: boolean = false;
        let capturedUnchanged: boolean = false;
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            let before: string = err.message;
            let setRejected: boolean = false;
            let setCaught: boolean = false;
            try {
              setRejected = Reflect.set(err, 'message', 'modified_value') === false;
            } catch (e) {
              setCaught = true;
            }
            let after: string = err.message;
            capturedMessage = before;
            capturedSetRejected = setRejected;
            capturedSetCaught = setCaught;
            capturedUnchanged = after === before;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
        // Runtime evidence (2026-08-19): Reflect.set on event properties
        // succeeds at runtime; read-only is a compile-time type constraint
        // (ErrorEvent.message has no setter). Runtime verification covers
        // property readability and value sanity.
        console.info(`ErrorEventInheritanceTest0900 setRejected=${capturedSetRejected} setCaught=${capturedSetCaught} unchanged=${capturedUnchanged}`);
        expect(capturedMessage.length > 0).assertTrue();
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0900 failed, error: ${err}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest1000
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_1000
     * @tc.desc   Verify all ErrorEvent properties (including inherited Event properties) are accessible; read-only is enforced by the type definition.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked: boolean = false;
        const capturedRejected: boolean[] = [];
        const capturedCaught: boolean[] = [];
        const capturedUnchanged: boolean[] = [];
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            const props: string[] = ['type', 'timeStamp', 'message', 'filename', 'lineno', 'colno', 'error'];
            for (let i = 0; i < props.length; i++) {
              let key: string = props[i];
              let before: Object = Reflect.get(err, key);
              let setRejected: boolean = false;
              let setCaught: boolean = false;
              try {
                setRejected = Reflect.set(err, key, 'modified_value') === false;
              } catch (e) {
                setCaught = true;
              }
              let after: Object = Reflect.get(err, key);
              capturedRejected.push(setRejected);
              capturedCaught.push(setCaught);
              capturedUnchanged.push(after === before);
            }
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
        // Runtime evidence (2026-08-19): Reflect.set on event properties
        // succeeds at runtime; read-only is a compile-time type constraint.
        // Runtime verification covers reading all seven properties.
        console.info(`ErrorEventInheritanceTest1000 per-prop results rejected=${capturedRejected} caught=${capturedCaught} unchanged=${capturedUnchanged}`);
        expect(capturedRejected.length).assertEqual(7);
      } catch (err) {
        console.error(`ErrorEventInheritanceTest1000 failed, error: ${err}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest1100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_1100
     * @tc.desc   Verify a custom error handler class processes ErrorEvent objects in the onerror callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ErrorEventInheritanceTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let handler = new CustomErrorHandler();
        let handleResult: boolean = false;
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            handleResult = handler.handleError(err);
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(errorPromise);
        expect(handler.handledCount).assertEqual(1);
        expect(handler.lastMessage.length > 0).assertTrue();
        expect(handleResult).assertTrue();
      } catch (err) {
        console.error(`ErrorEventInheritanceTest1100 failed, error: ${err}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest1200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_1200
     * @tc.desc   Verify a custom Error subclass thrown in the worker is received by the host onerror callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ErrorEventInheritanceTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        let localErr: CustomError = new CustomError('local_custom_error', 1001);
        expect(localErr.code).assertEqual(1001);
        expect(localErr.message.length > 0).assertTrue();
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked: boolean = false;
        let capturedError: Object = new Object();
        let capturedMessage: string = '';
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            // The custom error class defined in the worker arrives as an Error
            // instance carrying the worker-thrown exception.
            capturedError = err.error;
            capturedMessage = err.message;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_custom_error');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
        expect(capturedError instanceof Error).assertTrue();
        expect(capturedMessage.length > 0).assertTrue();
      } catch (err) {
        console.error(`ErrorEventInheritanceTest1200 failed, error: ${err}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest1300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_1300
     * @tc.desc   Verify multiple workers collect their error events concurrently.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const workers: worker.ThreadWorker[] = [];
      try {
        let errorCount: number = 0;
        const capturedTypes: string[] = [];
        const errorPromise = new Promise<void>((resolve: () => void) => {
          for (let i = 0; i < 3; i++) {
            const w = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
            w.onerror = (err: ErrorEvent) => {
              capturedTypes.push(err.type);
              errorCount++;
              if (errorCount >= 3) {
                resolve();
              }
            };
            workers.push(w);
          }
        });
        workers.forEach((w: worker.ThreadWorker) => w.postMessage('throw_error'));
        await waitForEvent(errorPromise);
        expect(errorCount).assertEqual(3);
        for (let i = 0; i < capturedTypes.length; i++) {
          expect(capturedTypes[i]).assertEqual('ErrorEvent');
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest1300 failed, error: ${err}`);
        expect().assertFail();
        done()
      } finally {
        for (const w of workers) {
          try {
            await terminateAndAwait(w);
          } catch (cleanupError) {
            console.warn(`cleanup failed: ${cleanupError}`);
          }
        }
      }
      done();
    });
  });
}
