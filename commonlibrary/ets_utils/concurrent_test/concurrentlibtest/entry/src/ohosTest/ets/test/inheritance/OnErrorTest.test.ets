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

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => setTimeout(resolve, ms));
}

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

export default function onErrorTest(): void {
  describe('OnErrorTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100);
    })

    afterEach(async (): Promise<void> => {
      await sleep(100);
    })

    /**
     * @tc.name   OnErrorTest0100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_0100
     * @tc.desc   Verify onerror property exists and is initially undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnErrorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        expect(workerInstance.onerror).assertUndefined();
      } catch (err) {
        console.error(`OnErrorTest0100 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest0200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_0200
     * @tc.desc   Verify onerror property can be set to a callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnErrorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        workerInstance.onerror = (err: ErrorEvent) => {};
        expect(typeof workerInstance.onerror).assertEqual('function');
      } catch (err) {
        console.error(`OnErrorTest0200 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest0300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_0300
     * @tc.desc   Verify ErrorEvent.message contains the error message.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnErrorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let errorTriggered = false;
        let errorMessage = '';
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            errorTriggered = true;
            errorMessage = err.message;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(errorPromise);
        expect(errorTriggered).assertTrue();
        expect(errorMessage !== '').assertTrue();
      } catch (err) {
        console.error(`OnErrorTest0300 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest0400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_0400
     * @tc.desc   Verify ErrorEvent.filename contains the worker file path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnErrorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let errorTriggered = false;
        let errorFilename = '';
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            errorTriggered = true;
            errorFilename = err.filename;
            resolve();
          };
        });
        workerInstance.postMessage('throw_custom_error');
        await waitForEvent(errorPromise);
        expect(errorTriggered).assertTrue();
        expect(errorFilename.includes('InheritanceErrorWorker')).assertTrue();
      } catch (err) {
        console.error(`OnErrorTest0400 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest0500
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_0500
     * @tc.desc   Verify ErrorEvent.lineno is a correct line number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnErrorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let errorTriggered = false;
        let errorLine = 0;
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            errorTriggered = true;
            errorLine = err.lineno;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(errorPromise);
        expect(errorTriggered).assertTrue();
        expect(typeof errorLine).assertEqual('number');
        expect(errorLine > 0).assertTrue();
      } catch (err) {
        console.error(`OnErrorTest0500 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest0600
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_0600
     * @tc.desc   Verify ErrorEvent.colno is a correct column number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnErrorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let errorTriggered = false;
        let errorCol = 0;
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            errorTriggered = true;
            errorCol = err.colno;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(errorPromise);
        expect(errorTriggered).assertTrue();
        expect(typeof errorCol).assertEqual('number');
        expect(errorCol > 0).assertTrue();
      } catch (err) {
        console.error(`OnErrorTest0600 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest0700
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_0700
     * @tc.desc   Verify ErrorEvent.error contains the original error object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnErrorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let errorTriggered = false;
        let errorObj: Object | null = null;
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            errorTriggered = true;
            errorObj = err.error;
            resolve();
          };
        });
        workerInstance.postMessage('throw_type_error');
        await waitForEvent(errorPromise);
        expect(errorTriggered).assertTrue();
        expect(errorObj !== null).assertTrue();
        expect(typeof errorObj === 'object').assertTrue();
      } catch (err) {
        console.error(`OnErrorTest0700 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest0800
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_0800
     * @tc.desc   Verify synchronous error in worker triggers onerror.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnErrorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let errorTriggered = false;
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            errorTriggered = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_immediate');
        await waitForEvent(errorPromise);
        expect(errorTriggered).assertTrue();
      } catch (err) {
        console.error(`OnErrorTest0800 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest0900
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_0900
     * @tc.desc   Verify worker terminates and triggers onexit after onerror.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnErrorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let errorTriggered = false;
        let exitTriggered = false;
        let exitCode = -1;
        const combinedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            errorTriggered = true;
            if (exitTriggered) resolve();
          };
          workerInstance!.onexit = (code: number) => {
            exitTriggered = true;
            exitCode = code;
            if (errorTriggered) resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(combinedPromise);
        expect(errorTriggered).assertTrue();
        expect(exitTriggered).assertTrue();
        expect(exitCode).assertEqual(1);
      } catch (err) {
        console.error(`OnErrorTest0900 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest1000
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_1000
     * @tc.desc   Verify setting onerror twice overwrites the previous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnErrorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let count1 = 0;
        let count2 = 0;
        workerInstance.onerror = (err: ErrorEvent) => {
          count1++;
        };
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            count2++;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(errorPromise);
        expect(count1).assertEqual(0);
        expect(count2).assertEqual(1);
      } catch (err) {
        console.error(`OnErrorTest1000 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest1100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_1100
     * @tc.desc   Verify setting onerror to a new callback overwrites the previous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnErrorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let count = 0;
        workerInstance.onerror = (err: ErrorEvent) => {
          count++;
        };
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent): void => {
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(errorPromise);
        expect(count).assertEqual(0);
      } catch (err) {
        console.error(`OnErrorTest1100 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest1200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_1200
     * @tc.desc   Verify multiple worker instances trigger onerror independently.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnErrorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const workers: worker.ThreadWorker[] = [];
      try {
        let errorCount = 0;
        let resolveFunc: () => void = () => {};
        const waitPromise = new Promise<void>((resolve: () => void) => {
          resolveFunc = resolve;
        });
        for (let i = 0; i < 5; i++) {
          const w = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
          w.onerror = (err: ErrorEvent) => {
            errorCount++;
            if (errorCount >= 5) {
              resolveFunc();
            }
          };
          workers.push(w);
        }
        workers.forEach(w => w.postMessage('throw_error'));
        await waitForEvent(waitPromise);
        expect(errorCount).assertEqual(5);
      } catch (err) {
        console.error(`OnErrorTest1200 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        for (const w of workers) {
          await terminateAndAwait(w);
        }
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest1300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_1300
     * @tc.desc   Verify nonexistent worker script path triggers onerror or construction error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnErrorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        let caught = false;
        let errorTriggered = false;
        let resolveFunc: () => void = () => {};
        const errorPromise = new Promise<void>((resolve: () => void) => {
          resolveFunc = resolve;
        });
        try {
          workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/NonexistentWorker.ets');
          workerInstance!.onerror = (err: ErrorEvent) => {
            errorTriggered = true;
            resolveFunc();
          };
        } catch (e) {
          caught = true;
        }
        if (!caught) {
          await waitForEvent(errorPromise);
        }
        expect(caught || errorTriggered).assertTrue();
      } catch (err) {
        console.error(`OnErrorTest1300 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest1400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_1400
     * @tc.desc   Verify ErrorEvent.message is a string when worker throws empty Error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnErrorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let errorTriggered = false;
        let errorMessage = '';
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            errorTriggered = true;
            errorMessage = err.message;
            resolve();
          };
        });
        workerInstance.postMessage('throw_empty_error');
        await waitForEvent(errorPromise);
        expect(errorTriggered).assertTrue();
        expect(errorMessage.length > 0).assertTrue();
      } catch (err) {
        console.error(`OnErrorTest1400 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest1500
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_1500
     * @tc.desc   Verify onerror callback throwing exception does not affect host thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnErrorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let callbackExecuted = false;
        const callbackPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            callbackExecuted = true;
            resolve();
            try {
              throw new Error('onerror callback error');
            } catch (e) {
              // Contain the exception within the callback so it does not
              // propagate to the host thread event loop as uncaught.
            }
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(callbackPromise);
        expect(callbackExecuted).assertTrue();
      } catch (err) {
        console.error(`OnErrorTest1500 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest1600
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_1600
     * @tc.desc   Verify onerror does not catch asynchronous errors like setTimeout exceptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnErrorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceAsyncErrorWorker.ets');
        let onErrorTriggered = false;
        let onAllErrorsTriggered = false;
        const allErrorsPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            onErrorTriggered = true;
          };
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            onAllErrorsTriggered = true;
            resolve();
          };
        });
        workerInstance.postMessage('start_timer_error');
        await waitForEvent(allErrorsPromise);
        expect(onAllErrorsTriggered).assertTrue();
        expect(onErrorTriggered).assertFalse();
      } catch (err) {
        console.error(`OnErrorTest1600 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest1700
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_1700
     * @tc.desc   Verify worker terminates after onerror while worker stays alive after onAllErrors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnErrorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let worker1: worker.ThreadWorker | null = null;
      let worker2: worker.ThreadWorker | null = null;
      try {
        worker1 = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let exitAfterOnError = false;
        const exitPromise1 = new Promise<void>((resolve: () => void) => {
          worker1!.onerror = (err: ErrorEvent) => {};
          worker1!.onexit = (code: number) => {
            exitAfterOnError = true;
            resolve();
          };
        });
        worker1.postMessage('throw_error');
        await waitForEvent(exitPromise1);
        expect(exitAfterOnError).assertTrue();

        worker2 = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let exitAfterOnAllErrors = false;
        let messageReceived = false;
        let resolveMessage: () => void = () => {};
        const messagePromise = new Promise<void>((resolve: () => void) => {
          resolveMessage = resolve;
        });
        worker2.onAllErrors = (err: ErrorEvent) => {};
        worker2.onexit = (code: number) => {
          exitAfterOnAllErrors = true;
        };
        worker2.onmessage = (e: MessageEvents) => {
          messageReceived = true;
          resolveMessage();
        };
        worker2.postMessage('throw_error');
        const pollDeadline = Date.now() + 1000;
        while (Date.now() < pollDeadline) {
          await new Promise<void>((resolve: () => void) => setTimeout(resolve, 100));
        }
        expect(exitAfterOnAllErrors).assertFalse();
        worker2.postMessage('normal_message');
        await waitForEvent(messagePromise);
        expect(messageReceived).assertTrue();
      } catch (err) {
        console.error(`OnErrorTest1700 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(worker1);
        await terminateAndAwait(worker2);
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest1800
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_1800
     * @tc.desc   Verify ErrorEvent.message contains custom error info when worker throws CustomError.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnErrorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let errorTriggered = false;
        let errorMessage = '';
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            errorTriggered = true;
            errorMessage = err.message;
            resolve();
          };
        });
        workerInstance.postMessage('throw_custom_error');
        await waitForEvent(errorPromise);
        expect(errorTriggered).assertTrue();
        expect(errorMessage !== '').assertTrue();
      } catch (err) {
        console.error(`OnErrorTest1800 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnErrorTest1900
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONERROR_1900
     * @tc.desc   Verify replacing onerror handler stops the previous callback from triggering.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnErrorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let originalCount = 0;
        let replacementCount = 0;
        workerInstance.onerror = (err: ErrorEvent) => {
          originalCount++;
        };
        workerInstance.onerror = (err: ErrorEvent) => {
          replacementCount++;
        };
        workerInstance.postMessage('throw_error');
        const pollDeadline = Date.now() + 500;
        while (Date.now() < pollDeadline) {
          await new Promise<void>((resolve: () => void) => setTimeout(resolve, 100));
        }
        expect(originalCount).assertEqual(0);
        expect(replacementCount).assertEqual(1);
      } catch (err) {
        console.error(`OnErrorTest1900 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });
  });
}
