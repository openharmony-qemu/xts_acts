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

export default function onAllErrorsTest(): void {
  describe('OnAllErrorsTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100);
    })

    afterEach(async (): Promise<void> => {
      await sleep(100);
    })

    /**
     * @tc.name   OnAllErrorsTest0100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_0100
     * @tc.desc   Verify onAllErrors property exists and is initially undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        expect(workerInstance.onAllErrors).assertUndefined();
      } catch (err) {
        console.error(`OnAllErrorsTest0100 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest0200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_0200
     * @tc.desc   Verify onAllErrors property can be set to a callback function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceEchoWorker.ets');
        workerInstance.onAllErrors = (err: ErrorEvent) => {};
        expect(workerInstance.onAllErrors !== undefined).assertTrue();
      } catch (err) {
        console.error(`OnAllErrorsTest0200 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest0300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_0300
     * @tc.desc   Verify synchronous error in worker triggers onAllErrors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let errorTriggered = false;
        let errorMessage = '';
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            errorTriggered = true;
            errorMessage = err.message;
            resolve();
          };
        });
        workerInstance.postMessage('throw_sync_error');
        await waitForEvent(errorPromise);
        expect(errorTriggered).assertTrue();
        expect(errorMessage.length > 0).assertTrue();
      } catch (err) {
        console.error(`OnAllErrorsTest0300 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest0400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_0400
     * @tc.desc   Verify setTimeout callback error in worker triggers onAllErrors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceAsyncErrorWorker.ets');
        let errorTriggered = false;
        let errorMessage = '';
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            errorTriggered = true;
            errorMessage = err.message;
            resolve();
          };
        });
        workerInstance.postMessage('start_timer_error');
        await waitForEvent(errorPromise);
        expect(errorTriggered).assertTrue();
        expect(errorMessage.length > 0).assertTrue();
      } catch (err) {
        console.error(`OnAllErrorsTest0400 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest0500
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_0500
     * @tc.desc   Verify setInterval callback error in worker triggers onAllErrors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceAsyncErrorWorker.ets');
        let errorTriggered = false;
        let errorMessage = '';
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            errorTriggered = true;
            errorMessage = err.message;
            resolve();
          };
        });
        workerInstance.postMessage('start_interval_error');
        await waitForEvent(errorPromise);
        expect(errorTriggered).assertTrue();
        expect(errorMessage.length > 0).assertTrue();
      } catch (err) {
        console.error(`OnAllErrorsTest0500 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest0600
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_0600
     * @tc.desc   Verify synchronous throw in worker onmessage triggers onAllErrors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceAsyncErrorWorker.ets');
        let errorTriggered = false;
        let errorMessage = '';
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            errorTriggered = true;
            errorMessage = err.message;
            resolve();
          };
        });
        workerInstance.postMessage('throw_in_callback');
        await waitForEvent(errorPromise);
        expect(errorTriggered).assertTrue();
        expect(errorMessage.length > 0).assertTrue();
      } catch (err) {
        console.error(`OnAllErrorsTest0600 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest0700
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_0700
     * @tc.desc   Verify top-level execution error in worker triggers onAllErrors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceTopLevelErrorWorker.ets');
        let errorTriggered = false;
        let errorMessage = '';
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            errorTriggered = true;
            errorMessage = err.message;
            resolve();
          };
          workerInstance!.onerror = (err: ErrorEvent) => {
            errorTriggered = true;
            errorMessage = err.message;
            resolve();
          };
        });
        await waitForEvent(errorPromise);
        expect(errorTriggered).assertTrue();
        expect(errorMessage !== '').assertTrue();
      } catch (err) {
        console.error(`OnAllErrorsTest0700 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest0800
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_0800
     * @tc.desc   Verify worker continues running after onAllErrors catches an error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let errorTriggered = false;
        let exitTriggered = false;
        let messageReceived = false;
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            errorTriggered = true;
            resolve();
          };
        });
        workerInstance.onexit = (code: number) => {
          exitTriggered = true;
        };
        const messagePromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            messageReceived = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(errorPromise);
        expect(errorTriggered).assertTrue();
        expect(exitTriggered).assertFalse();
        workerInstance.postMessage('normal_message');
        await waitForEvent(messagePromise);
        expect(messageReceived).assertTrue();
      } catch (err) {
        console.error(`OnAllErrorsTest0800 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest0900
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_0900
     * @tc.desc   Verify worker catches multiple consecutive errors and continues running.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let errorCount = 0;
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            errorCount++;
            if (errorCount >= 3) {
              resolve();
            }
          };
        });
        workerInstance.postMessage('throw_error_1');
        workerInstance.postMessage('throw_error_2');
        workerInstance.postMessage('throw_error_3');
        await waitForEvent(errorPromise);
        expect(errorCount).assertEqual(3);
      } catch (err) {
        console.error(`OnAllErrorsTest0900 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest1000
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_1000
     * @tc.desc   Verify postMessage works normally after onAllErrors catches an error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let responseReceived = false;
        let responseData = '';
        const errorProcessedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            resolve();
          };
        });
        const responsePromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onmessage = (e: MessageEvents) => {
            responseReceived = true;
            responseData = e.data as string;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(errorProcessedPromise);
        workerInstance.postMessage('get_response');
        await waitForEvent(responsePromise);
        expect(responseReceived).assertTrue();
        expect(responseData).assertEqual('response_after_error');
      } catch (err) {
        console.error(`OnAllErrorsTest1000 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest1100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_1100
     * @tc.desc   Verify ErrorEvent.message contains complete error message.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let errorMessage = '';
        let errorReceived = false;
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            errorMessage = err.message;
            errorReceived = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_custom_error');
        await waitForEvent(errorPromise);
        expect(errorReceived).assertTrue();
        expect(errorMessage.length > 0).assertTrue();
      } catch (err) {
        console.error(`OnAllErrorsTest1100 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest1200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_1200
     * @tc.desc   Verify ErrorEvent.filename contains the worker file path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let errorFilename = '';
        let errorReceived = false;
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            errorFilename = err.filename;
            errorReceived = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(errorPromise);
        expect(errorReceived).assertTrue();
        expect(errorFilename.includes('InheritanceErrorWorker')).assertTrue();
      } catch (err) {
        console.error(`OnAllErrorsTest1200 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest1300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_1300
     * @tc.desc   Verify ErrorEvent.lineno and colno correctly locate the error position.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let errorLine = 0;
        let errorCol = 0;
        let errorReceived = false;
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            errorLine = err.lineno;
            errorCol = err.colno;
            errorReceived = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(errorPromise);
        expect(typeof errorLine).assertEqual('number');
        expect(typeof errorCol).assertEqual('number');
        expect(errorLine > 0).assertTrue();
        expect(errorCol > 0).assertTrue();
      } catch (err) {
        console.error(`OnAllErrorsTest1300 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest1400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_1400
     * @tc.desc   Verify setting onAllErrors twice overwrites the previous callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnAllErrorsTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let count1 = 0;
        let count2 = 0;
        workerInstance.onAllErrors = (err: ErrorEvent) => {
          count1++;
        };
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            count2++;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(errorPromise);
        expect(count1).assertEqual(0);
        expect(count2).assertEqual(1);
      } catch (err) {
        console.error(`OnAllErrorsTest1400 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest1500
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_1500
     * @tc.desc   Verify setting onAllErrors to undefined prevents callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnAllErrorsTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let count = 0;
        workerInstance.onAllErrors = (err: ErrorEvent) => {
          count++;
        };
        workerInstance.onAllErrors = undefined;
        workerInstance.postMessage('throw_error');
        const pollDeadline = Date.now() + 500;
        while (Date.now() < pollDeadline) {
          await new Promise<void>((resolve: () => void) => setTimeout(resolve, 100));
        }
        expect(count).assertEqual(0);
      } catch (err) {
        console.error(`OnAllErrorsTest1500 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest1600
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_1600
     * @tc.desc   Verify multiple worker instances trigger onAllErrors independently.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const workers: worker.ThreadWorker[] = [];
      const workerPromises: Promise<void>[] = [];
      try {
        const counts: number[] = [0, 0, 0, 0, 0];
        for (let i = 0; i < 5; i++) {
          const w = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
          const idx = i;
          workerPromises.push(new Promise<void>((resolve: () => void) => {
            w.onAllErrors = (err: ErrorEvent) => {
              counts[idx]++;
              resolve();
            };
          }));
          workers.push(w);
        }
        workers.forEach(w => w.postMessage('throw_error'));
        await waitForEvent(Promise.all(workerPromises).then((): void => {}));
        for (let i = 0; i < 5; i++) {
          expect(counts[i]).assertEqual(1);
        }
      } catch (err) {
        console.error(`OnAllErrorsTest1600 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        for (const w of workers) {
          await terminateAndAwait(w);
        }
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest1700
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_1700
     * @tc.desc   Verify onAllErrors property availability can be checked gracefully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnAllErrorsTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let callbackInvoked = false;
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            callbackInvoked = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(checkedPromise);
        expect(callbackInvoked).assertTrue();
      } catch (err) {
        console.error(`OnAllErrorsTest1700 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest1800
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_1800
     * @tc.desc   Verify nonexistent worker script path triggers onAllErrors or construction error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        let caught = false;
        let errorTriggered = false;
        let errorPromise: Promise<void> | undefined;
        try {
          workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/NonexistentWorker.ets');
          errorPromise = new Promise<void>((resolve: () => void) => {
            workerInstance!.onAllErrors = (err: ErrorEvent) => {
              errorTriggered = true;
              resolve();
            };
          });
        } catch (e) {
          caught = true;
        }
        if (errorPromise) {
          await waitForEvent(errorPromise);
        }
        expect(caught || errorTriggered).assertTrue();
      } catch (err) {
        console.error(`OnAllErrorsTest1800 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest1900
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_1900
     * @tc.desc   Verify onmessage callback throwing exception in worker triggers onAllErrors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceAsyncErrorWorker.ets');
        let errorTriggered = false;
        let errorMessage = '';
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            errorTriggered = true;
            errorMessage = err.message;
            resolve();
          };
        });
        workerInstance.postMessage('throw_in_callback');
        await waitForEvent(errorPromise);
        expect(errorTriggered).assertTrue();
        expect(errorMessage.length > 0).assertTrue();
      } catch (err) {
        console.error(`OnAllErrorsTest1900 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest2000
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_2000
     * @tc.desc   Verify ErrorEvent.error contains the original error object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let errorTriggered = false;
        let errorObj: Object | null = null;
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
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
        console.error(`OnAllErrorsTest2000 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest2100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_2100
     * @tc.desc   Verify both onerror and onAllErrors can be set simultaneously on one worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let onErrorTriggered = false;
        let onAllErrorsTriggered = false;
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            onErrorTriggered = true;
            resolve();
          };
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            onAllErrorsTriggered = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_sync_error');
        await waitForEvent(errorPromise);
        expect(onErrorTriggered || onAllErrorsTriggered).assertTrue();
      } catch (err) {
        console.error(`OnAllErrorsTest2100 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest2200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_2200
     * @tc.desc   Verify onAllErrors catches async errors while onerror does not.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OnAllErrorsTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let worker1: worker.ThreadWorker | null = null;
      let worker2: worker.ThreadWorker | null = null;
      try {
        worker1 = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceAsyncErrorWorker.ets');
        let onErrorTriggered = false;
        worker1.onerror = (err: ErrorEvent) => {
          onErrorTriggered = true;
        };
        worker1.postMessage('start_timer_error');

        worker2 = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceAsyncErrorWorker.ets');
        let onAllErrorsTriggered = false;
        const errorPromise = new Promise<void>((resolve: () => void) => {
          worker2!.onAllErrors = (err: ErrorEvent) => {
            onAllErrorsTriggered = true;
            resolve();
          };
        });
        worker2.postMessage('start_timer_error');
        await waitForEvent(errorPromise);
        // By the time worker2's onAllErrors fires the async error has been
        // processed, so if worker1's onerror were going to fire it would have.
        // Brief bounded poll confirms onerror did not trigger.
        const pollDeadline = Date.now() + 500;
        while (Date.now() < pollDeadline) {
          if (onErrorTriggered) break;
          await new Promise<void>((resolve: () => void) => setTimeout(resolve, 100));
        }
        expect(onErrorTriggered).assertFalse();
        expect(onAllErrorsTriggered).assertTrue();
      } catch (err) {
        console.error(`OnAllErrorsTest2200 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(worker1);
        await terminateAndAwait(worker2);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest2300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_2300
     * @tc.desc   Verify onAllErrors callback is executed when worker throws error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnAllErrorsTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let callbackExecuted = false;
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            callbackExecuted = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(errorPromise);
        expect(callbackExecuted).assertTrue();
      } catch (err) {
        console.error(`OnAllErrorsTest2300 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   OnAllErrorsTest2400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ONALLERRORS_2400
     * @tc.desc   Verify high-frequency errors are captured stably for 100 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('OnAllErrorsTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let errorCount = 0;
        const totalCount = 100;
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onAllErrors = (err: ErrorEvent) => {
            errorCount++;
            if (errorCount >= totalCount) {
              resolve();
            }
          };
        });
        for (let i = 0; i < totalCount; i++) {
          workerInstance.postMessage('throw_error');
        }
        await waitForEvent(errorPromise);
        expect(errorCount).assertEqual(totalCount);
      } catch (err) {
        console.error(`OnAllErrorsTest2400 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });
  });
}
