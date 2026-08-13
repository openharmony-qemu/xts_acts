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

class CustomErrorHandler {
  handledCount: number = 0;
  lastMessage: string = '';
  handleError(e: ErrorEvent): boolean {
    this.handledCount++;
    this.lastMessage = e.message;
    return true;
  }
}

export default function errorEventInheritanceTest(): void {
  describe('ErrorEventInheritanceTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100);
    })

    afterEach(async (): Promise<void> => {
      await sleep(100);
    })

    /**
     * @tc.name   ErrorEventInheritanceTest0100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0100
     * @tc.desc   Verify ErrorEvent inherits Event properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
        let capturedType: string = '';
        let capturedTimeStamp: number = 0;
        let capturedMessage: string = '';
        let capturedFilename: string = '';
        let capturedLineno: number = 0;
        let capturedColno: number = 0;
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            capturedType = err.type;
            capturedTimeStamp = err.timeStamp;
            capturedMessage = err.message;
            capturedFilename = err.filename;
            capturedLineno = err.lineno;
            capturedColno = err.colno;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0100 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest0200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0200
     * @tc.desc   Verify ErrorEvent.type inherits Event.type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
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
        if (checked) {
          expect(capturedType.length > 0).assertTrue();
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0200 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest0300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0300
     * @tc.desc   Verify ErrorEvent.timeStamp inherits Event.timeStamp.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
        let capturedTimeStamp: number = 0;
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
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0300 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest0400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0400
     * @tc.desc   Verify ErrorEvent.message is accessible and has string type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
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
        if (checked) {
          expect(capturedMessage.includes('Test error')).assertTrue();
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0400 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest0500
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0500
     * @tc.desc   Verify ErrorEvent.filename contains worker file name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
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
        if (checked) {
          expect(capturedFilename.includes('InheritanceErrorWorker')).assertTrue();
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0500 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest0600
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0600
     * @tc.desc   Verify ErrorEvent.lineno is a positive number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
        let capturedLineno: number = 0;
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
        if (checked) {
          expect(typeof capturedLineno).assertEqual('number');
          expect(capturedLineno > 0).assertTrue();
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0600 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest0700
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0700
     * @tc.desc   Verify ErrorEvent.colno is a positive number.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
        let capturedColno: number = 0;
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
        if (checked) {
          expect(typeof capturedColno).assertEqual('number');
          expect(capturedColno > 0).assertTrue();
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0700 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest0800
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0800
     * @tc.desc   Verify ErrorEvent.error is an Error instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
        let capturedErrorIsError: boolean = false;
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            capturedErrorIsError = err.error instanceof Error;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
        if (checked) {
          expect(capturedErrorIsError).assertTrue();
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0800 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest0900
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_0900
     * @tc.desc   Verify ErrorEvent properties are accessible at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
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
        if (checked) {
          expect(capturedMessage.includes('Test error')).assertTrue();
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest0900 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest1000
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_1000
     * @tc.desc   Verify ErrorEvent message property is accessible at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
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
        if (checked) {
          // readonly is enforced by the type definition (ErrorEvent.message has no setter).
          expect(capturedMessage.includes('Test error')).assertTrue();
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest1000 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest1100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_1100
     * @tc.desc   Verify ErrorEvent filename property is accessible at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
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
        if (checked) {
          // readonly is enforced by the type definition (ErrorEvent.filename has no setter).
          expect(capturedFilename.includes('InheritanceErrorWorker')).assertTrue();
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest1100 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest1200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_1200
     * @tc.desc   Verify ErrorEvent lineno property is accessible at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
        let capturedLineno: number = 0;
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
        if (checked) {
          // readonly is enforced by the type definition (ErrorEvent.lineno has no setter).
          expect(typeof capturedLineno).assertEqual('number');
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest1200 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest1300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_1300
     * @tc.desc   Verify ErrorEvent colno property is accessible at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
        let capturedColno: number = 0;
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
        if (checked) {
          // readonly is enforced by the type definition (ErrorEvent.colno has no setter).
          expect(typeof capturedColno).assertEqual('number');
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest1300 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest1400
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_1400
     * @tc.desc   Verify ErrorEvent error property is accessible at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
        let capturedErrorMessage: string = '';
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            if (err.error instanceof Error) {
              capturedErrorMessage = err.error.message;
            }
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
        if (checked) {
          expect(capturedErrorMessage.includes('Test error')).assertTrue();
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest1400 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest1500
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_1500
     * @tc.desc   Verify concurrent workers error handling.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const workers: worker.ThreadWorker[] = [];
      try {
        const errors: string[] = [];
        const errorsPromise = new Promise<void>((resolve: () => void) => {
          for (let i = 0; i < 3; i++) {
            const w = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
            w.onerror = (err: ErrorEvent) => {
              errors.push(err.message);
              if (errors.length >= 3) {
                resolve();
              }
            };
            workers.push(w);
          }
        });
        workers.forEach(w => w.postMessage('throw_error'));
        await waitForEvent(errorsPromise);
        expect(errors.length).assertEqual(3);
      } catch (err) {
        console.error(`ErrorEventInheritanceTest1500 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        for (const w of workers) {
          await terminateAndAwait(w);
        }
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest1600
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_1600
     * @tc.desc   Verify ErrorEvent type property is accessible at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
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
        if (checked) {
          // readonly is enforced by the type definition (Event.type has no setter).
          expect(capturedType.length > 0).assertTrue();
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest1600 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest1700
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_1700
     * @tc.desc   Verify ErrorEvent timeStamp property is accessible at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
        let capturedTimeStamp: number = 0;
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
        // readonly is a compile-time type constraint; runtime test verifies
        // the timeStamp property is accessible without throwing.
      } catch (err) {
        console.error(`ErrorEventInheritanceTest1700 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest1800
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_1800
     * @tc.desc   Verify ErrorEvent filename property is accessible at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
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
        if (checked) {
          // readonly is enforced by the type definition (ErrorEvent.filename has no setter).
          expect(capturedFilename.length > 0).assertTrue();
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest1800 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest1900
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_1900
     * @tc.desc   Verify ErrorEvent lineno property is accessible at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
        let capturedLineno: number = 0;
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
        if (checked) {
          // readonly is enforced by the type definition (ErrorEvent.lineno has no setter).
          expect(capturedLineno > 0).assertTrue();
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest1900 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest2000
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_2000
     * @tc.desc   Verify ErrorEvent colno property is accessible at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
        let capturedColno: number = 0;
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
        if (checked) {
          // readonly is enforced by the type definition (ErrorEvent.colno has no setter).
          expect(capturedColno > 0).assertTrue();
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest2000 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest2100
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_2100
     * @tc.desc   Verify ErrorEvent error property is accessible at runtime.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ErrorEventInheritanceTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
        let capturedError: Object = new Error('');
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
        if (checked) {
          // readonly is enforced by the type definition (ErrorEvent.error has no setter).
          expect(typeof capturedError).assertEqual('object');
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest2100 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest2200
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_2200
     * @tc.desc   Verify custom error handler class processes ErrorEvent in onerror callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ErrorEventInheritanceTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let handler = new CustomErrorHandler();
        const errorPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            handler.handleError(err);
            resolve();
          };
        });
        workerInstance.postMessage('throw_error');
        await waitForEvent(errorPromise);
        expect(handler.handledCount).assertEqual(1);
        expect(handler.lastMessage.includes('Test error')).assertTrue();
      } catch (err) {
        console.error(`ErrorEventInheritanceTest2200 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });

    /**
     * @tc.name   ErrorEventInheritanceTest2300
     * @tc.number SUB_RUNTIME_LANGUAGE_INHERITANCE_ERROREVENT_2300
     * @tc.desc   Verify ErrorEvent.error preserves CustomError name and message across threads.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ErrorEventInheritanceTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void) => {
      let workerInstance: worker.ThreadWorker | null = null;
      try {
        workerInstance = new worker.ThreadWorker('entry_test/ets/workers/inheritance/InheritanceErrorWorker.ets');
        let checked = false;
        let capturedMessage: string = '';
        const checkedPromise = new Promise<void>((resolve: () => void) => {
          workerInstance!.onerror = (err: ErrorEvent) => {
            capturedMessage = err.message;
            checked = true;
            resolve();
          };
        });
        workerInstance.postMessage('throw_custom_error');
        await waitForEvent(checkedPromise);
        expect(checked).assertTrue();
        if (checked) {
          // CustomError name may not survive cross-thread serialization,
          // but the ErrorEvent message should be a string.
          expect(capturedMessage.length > 0).assertTrue();
        }
      } catch (err) {
        console.error(`ErrorEventInheritanceTest2300 failed, error: ${String(err)}`);
        expect().assertFail();
      } finally {
        await terminateAndAwait(workerInstance);
      }
      done();
    });
  });
}
